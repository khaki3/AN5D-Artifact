#define BENCH_DIM 3
#define BENCH_FPP 53
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
              0.0375f*A[t%2][i-1][j][k] +
              0.0371f*A[t%2][i-1][j-1][k-1] +
              0.0372f*A[t%2][i-1][j-1][k] +
              0.0373f*A[t%2][i-1][j-1][k+1] +
              0.0374f*A[t%2][i-1][j][k-1] +
              0.0376f*A[t%2][i-1][j][k+1] +
              0.0377f*A[t%2][i-1][j+1][k-1] +
              0.0378f*A[t%2][i-1][j+1][k] +
              0.0379f*A[t%2][i-1][j+1][k+1] +

              0.0355f*A[t%2][i][j][k] +
              0.0351f*A[t%2][i][j-1][k-1] +
              0.0352f*A[t%2][i][j-1][k] +
              0.0353f*A[t%2][i][j-1][k+1] +
              0.0354f*A[t%2][i][j][k-1] +
              0.0356f*A[t%2][i][j][k+1] +
              0.0357f*A[t%2][i][j+1][k-1] +
              0.0358f*A[t%2][i][j+1][k] +
              0.0359f*A[t%2][i][j+1][k+1] +

              0.0365f*A[t%2][i+1][j][k] +
              0.0361f*A[t%2][i+1][j-1][k-1] +
              0.0362f*A[t%2][i+1][j-1][k] +
              0.0363f*A[t%2][i+1][j-1][k+1] +
              0.0364f*A[t%2][i+1][j][k-1] +
              0.0366f*A[t%2][i+1][j][k+1] +
              0.0367f*A[t%2][i+1][j+1][k-1] +
              0.0368f*A[t%2][i+1][j+1][k] +
              0.0369f*A[t%2][i+1][j+1][k+1];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              0.0375f*A[t%2][i-1][j][k] +
              0.0371f*A[t%2][i-1][j-1][k-1] +
              0.0372f*A[t%2][i-1][j-1][k] +
              0.0373f*A[t%2][i-1][j-1][k+1] +
              0.0374f*A[t%2][i-1][j][k-1] +
              0.0376f*A[t%2][i-1][j][k+1] +
              0.0377f*A[t%2][i-1][j+1][k-1] +
              0.0378f*A[t%2][i-1][j+1][k] +
              0.0379f*A[t%2][i-1][j+1][k+1] +

              0.0355f*A[t%2][i][j][k] +
              0.0351f*A[t%2][i][j-1][k-1] +
              0.0352f*A[t%2][i][j-1][k] +
              0.0353f*A[t%2][i][j-1][k+1] +
              0.0354f*A[t%2][i][j][k-1] +
              0.0356f*A[t%2][i][j][k+1] +
              0.0357f*A[t%2][i][j+1][k-1] +
              0.0358f*A[t%2][i][j+1][k] +
              0.0359f*A[t%2][i][j+1][k+1] +

              0.0365f*A[t%2][i+1][j][k] +
              0.0361f*A[t%2][i+1][j-1][k-1] +
              0.0362f*A[t%2][i+1][j-1][k] +
              0.0363f*A[t%2][i+1][j-1][k+1] +
              0.0364f*A[t%2][i+1][j][k-1] +
              0.0366f*A[t%2][i+1][j][k+1] +
              0.0367f*A[t%2][i+1][j+1][k-1] +
              0.0368f*A[t%2][i+1][j+1][k] +
              0.0369f*A[t%2][i+1][j+1][k+1];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
