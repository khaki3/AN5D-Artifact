#define BENCH_DIM 2
#define BENCH_FPP 17
#define BENCH_RAD 1

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
            0.09371f * A[t%2][i-1][j-1] + 0.09374f * A[t%2][i-1][j] + 0.09376f * A[t%2][i-1][j+1] +
            0.09372f * A[t%2][i][j-1]   + 0.25001f * A[t%2][i][j]   + 0.09377f * A[t%2][i][j+1] +
            0.09373f * A[t%2][i+1][j-1] + 0.09375f * A[t%2][i+1][j] + 0.09378f * A[t%2][i+1][j+1];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          A[(t+1)%2][i][j] =
            0.09371f * A[t%2][i-1][j-1] + 0.09374f * A[t%2][i-1][j] + 0.09376f * A[t%2][i-1][j+1] +
            0.09372f * A[t%2][i][j-1]   + 0.25001f * A[t%2][i][j]   + 0.09377f * A[t%2][i][j+1] +
            0.09373f * A[t%2][i+1][j-1] + 0.09375f * A[t%2][i+1][j] + 0.09378f * A[t%2][i+1][j+1];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
