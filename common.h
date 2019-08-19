#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <getopt.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
#include <errno.h>

#define STENCILBENCH

#define SB_START_INSTRUMENTS do { start_time = sb_time(); } while (0)
#define SB_STOP_INSTRUMENTS  do { end_time   = sb_time(); } while (0)

#ifndef SB_TYPE
#define SB_TYPE float
#endif

void usage(char *cmd)
{
  printf("%s [OPTION] ...\n", cmd);
  printf("\n");
  printf("-s" "\t" "Specify compute size" "\n");
  printf("-t" "\t" "Specify the number of timesteps" "\n");
  printf("-n" "\t" "Specify the number of execution" "\n");
  printf("-c" "\t" "Enable comparison to CPU execution" "\n");
  printf("-h" "\t" "Show this usage" "\n");
}

double sb_time()
{
  struct timespec tp;

  if (clock_gettime(CLOCK_MONOTONIC_RAW, &tp) != 0)
    perror("clock_gettime failed");

  return (tp.tv_sec + tp.tv_nsec * 1.0e-9) * 1.0e3;
}

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop);

void init_grid(SB_TYPE *A, int compsize)
{
  size_t gridarea = 1, dimsize = compsize + BENCH_RAD * 2;
  for (int i = 0; i < BENCH_DIM; i++)
    gridarea *= dimsize;

#pragma omp parallel for
  for (size_t i = 0; i < gridarea; i++) {
    unsigned int seed = i + compsize;
    A[0 * gridarea + i] = 1000 * (SB_TYPE)(rand_r(&seed)) / (SB_TYPE)(RAND_MAX);
    A[1 * gridarea + i] = A[0 * gridarea + i];
  }
}

void check_result(SB_TYPE *A, SB_TYPE *B, int compsize, int timestep)
{
  int t = timestep % 2;

  size_t gridarea = 1, dimsize = compsize + BENCH_RAD * 2;
  for (int i = 0; i < BENCH_DIM; i++)
    gridarea *= dimsize;

  double error_max = 0.0;
  long double error_sum = 0.0;

#pragma omp parallel for reduction(max:error_max) reduction(+:error_sum)
  for (size_t i = 0; i < gridarea; i++) {
    double error = fabs((double)(A[t * gridarea + i] - B[t * gridarea + i]));
    error_max = (error > error_max) ? error : error_max;
    error_sum += error * error;
  }

  printf("Max Error: %e\n",  error_max);
  printf("RMS Error: %Le\n", sqrtl(error_sum / gridarea));
}

double calc_gflops(double total_flop, double ms)
{
  return (total_flop / ms) / (1000 * 1000);
}

int benchmark(int compsize, int timestep, int reptnum, bool cpucomp)
{
  size_t gridarea = 1, comparea = 1;

  for (int i = 0; i < BENCH_DIM; i++) {
    gridarea *= (compsize + BENCH_RAD * 2);
    comparea *= compsize;
  }

  double total_flop = (double)timestep * comparea * BENCH_FPP;

  SB_TYPE *A = (SB_TYPE *)malloc(2 * gridarea * sizeof(SB_TYPE));
  SB_TYPE *B = (SB_TYPE *)malloc(2 * gridarea * sizeof(SB_TYPE));

  if (A == NULL || B == NULL) {
    fprintf(stderr, "Host memory allocation failed\n");
    exit(EXIT_FAILURE);
  }

  puts("[Device warm-up]");
  printf("%.4f ms\n", kernel_stencil(A, compsize, timestep, true));

  double elapsed = 0.0f;

  puts("\n" "[Device execution]");
  for (int n = 0; n < reptnum; n++) {
    init_grid(A, compsize);
    double ms = kernel_stencil(A, compsize, timestep, true);
    printf("%7d: %10.4lf GFLOPS, %10.4f ms\n",
           n, calc_gflops(total_flop, ms), ms);
    elapsed += ms;
  }

  printf("Average: %10.4lf GFLOPS, %10.4f ms\n",
         calc_gflops(total_flop, elapsed / reptnum), elapsed / reptnum);

  if (cpucomp) {
    puts("\n" "[CPU execution]");
    init_grid(B, compsize);
    printf("%.4f ms\n", kernel_stencil(B, compsize, timestep, false));
    check_result(A, B, compsize, timestep);
  }

  free(A);
  free(B);

  return EXIT_SUCCESS;
}

int main(int argc, char **argv)
{
  int compsize = (BENCH_DIM == 2) ? 8192 : 512;
  int timestep = 120;
  int reptnum = 2;
  bool cpucomp = false;

  int opt;

  while((opt = getopt(argc, argv, "s:t:n:ch")) != -1) {
    switch (opt) {
    case 's':
      compsize = (int)strtol(optarg, NULL, 10);
      if (compsize < 1) {
        fprintf(stderr, "Larger compute size required: %d\n", compsize);
        exit(EXIT_FAILURE);
      }
      break;

    case 't':
      timestep = (int)strtol(optarg, NULL, 10);
      if (timestep < 1) {
        fprintf(stderr, "More than one time-step required: %d\n", timestep);
        exit(EXIT_FAILURE);
      }
      break;

    case 'n':
      reptnum = (int)strtol(optarg, NULL, 10);
      if (reptnum < 1) {
        fprintf(stderr, "More than one execution required: %d\n", reptnum);
        exit(EXIT_FAILURE);
      }
      break;

    case 'c':
      cpucomp = true;
      break;

    case 'h':
      usage(argv[0]);
      return EXIT_SUCCESS;
    }
  }

  return benchmark(compsize, timestep, reptnum, cpucomp);
}
