#define BENCH_DIM 3
#define BENCH_FPP 13
#define BENCH_RAD 1

#include "common.h"

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop)
{
  double start_time = sb_time(), end_time = 0.0;
  int dimsize = compsize + BENCH_RAD * 2;
  SB_TYPE (*A)[dimsize][dimsize][dimsize]
    = (SB_TYPE (*)[dimsize][dimsize][dimsize])A1;

  if (scop) {
#pragma scop
    for (int t = 0; t < timestep; t++)
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              0.2500f * A[t%2][i][j][k] + 
              0.1248f * A[t%2][i-1][j][k] + 0.1249f * A[t%2][i+1][j][k] +
              0.1250f * A[t%2][i][j-1][k] + 0.1251f * A[t%2][i][j+1][k] +
              0.1252f * A[t%2][i][j][k-1] + 0.1253f * A[t%2][i][j][k+1];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              0.2500f * A[t%2][i][j][k] + 
              0.1248f * A[t%2][i-1][j][k] + 0.1249f * A[t%2][i+1][j][k] +
              0.1250f * A[t%2][i][j-1][k] + 0.1251f * A[t%2][i][j+1][k] +
              0.1252f * A[t%2][i][j][k-1] + 0.1253f * A[t%2][i][j][k+1];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
