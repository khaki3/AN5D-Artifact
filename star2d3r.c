#define BENCH_DIM 2
#define BENCH_FPP 25
#define BENCH_RAD 3

#include "common.h"

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop)
{
  double start_time = sb_time(), end_time = 0.0;
  int dimsize = compsize + BENCH_RAD * 2;
  SB_TYPE (*A)[dimsize][dimsize] = (SB_TYPE (*)[dimsize][dimsize])A1;

  if (scop) {
#pragma scop
    for (int t = 0; t < timestep; t++)
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          A[(t+1)%2][i][j] =
            0.06251f * A[t%2][i-3][j] + 0.06255f * A[t%2][i-2][j] + 0.06245f * A[t%2][i-1][j] +
            0.06252f * A[t%2][i][j-3] + 0.06249f * A[t%2][i][j-2] + 0.06244f * A[t%2][i][j-1] +
            0.25002f * A[t%2][i][j]   + 0.06248f * A[t%2][i][j+1] + 0.06243f * A[t%2][i][j+2] +
            0.06253f * A[t%2][i][j+3] + 0.06246f * A[t%2][i+1][j] + 0.06242f * A[t%2][i+2][j] +
            0.06254f * A[t%2][i+3][j];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          A[(t+1)%2][i][j] =
            0.06251f * A[t%2][i-3][j] + 0.06255f * A[t%2][i-2][j] + 0.06245f * A[t%2][i-1][j] +
            0.06252f * A[t%2][i][j-3] + 0.06249f * A[t%2][i][j-2] + 0.06244f * A[t%2][i][j-1] +
            0.25002f * A[t%2][i][j]   + 0.06248f * A[t%2][i][j+1] + 0.06243f * A[t%2][i][j+2] +
            0.06253f * A[t%2][i][j+3] + 0.06246f * A[t%2][i+1][j] + 0.06242f * A[t%2][i+2][j] +
            0.06254f * A[t%2][i+3][j];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
