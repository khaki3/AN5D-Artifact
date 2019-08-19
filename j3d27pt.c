#define BENCH_DIM 3
#define BENCH_FPP 54
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
              (1.500f*A[t%2][i-1][j][k] +
               0.500f*A[t%2][i-1][j-1][k-1] +
               0.700f*A[t%2][i-1][j-1][k] +
               0.900f*A[t%2][i-1][j-1][k+1] +
               1.200f*A[t%2][i-1][j][k-1] +
               1.201f*A[t%2][i-1][j][k+1] +
               0.901f*A[t%2][i-1][j+1][k-1] +
               0.701f*A[t%2][i-1][j+1][k] +
               0.501f*A[t%2][i-1][j+1][k+1] +

               1.510f*A[t%2][i][j][k] +
               0.510f*A[t%2][i][j-1][k-1] +
               0.710f*A[t%2][i][j-1][k] +
               0.910f*A[t%2][i][j-1][k+1] +
               1.210f*A[t%2][i][j][k-1] +
               1.211f*A[t%2][i][j][k+1] +
               0.911f*A[t%2][i][j+1][k-1] +
               0.711f*A[t%2][i][j+1][k] +
               0.511f*A[t%2][i][j+1][k+1] +

               1.520f*A[t%2][i+1][j][k] +
               0.520f*A[t%2][i+1][j-1][k-1] +
               0.720f*A[t%2][i+1][j-1][k] +
               0.920f*A[t%2][i+1][j-1][k+1] +
               1.220f*A[t%2][i+1][j][k-1] +
               1.221f*A[t%2][i+1][j][k+1] +
               0.921f*A[t%2][i+1][j+1][k-1] +
               0.721f*A[t%2][i+1][j+1][k] +
               0.521f*A[t%2][i+1][j+1][k+1]) / 159;
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              (1.500f*A[t%2][i-1][j][k] +
               0.500f*A[t%2][i-1][j-1][k-1] +
               0.700f*A[t%2][i-1][j-1][k] +
               0.900f*A[t%2][i-1][j-1][k+1] +
               1.200f*A[t%2][i-1][j][k-1] +
               1.201f*A[t%2][i-1][j][k+1] +
               0.901f*A[t%2][i-1][j+1][k-1] +
               0.701f*A[t%2][i-1][j+1][k] +
               0.501f*A[t%2][i-1][j+1][k+1] +

               1.510f*A[t%2][i][j][k] +
               0.510f*A[t%2][i][j-1][k-1] +
               0.710f*A[t%2][i][j-1][k] +
               0.910f*A[t%2][i][j-1][k+1] +
               1.210f*A[t%2][i][j][k-1] +
               1.211f*A[t%2][i][j][k+1] +
               0.911f*A[t%2][i][j+1][k-1] +
               0.711f*A[t%2][i][j+1][k] +
               0.511f*A[t%2][i][j+1][k+1] +

               1.520f*A[t%2][i+1][j][k] +
               0.520f*A[t%2][i+1][j-1][k-1] +
               0.720f*A[t%2][i+1][j-1][k] +
               0.920f*A[t%2][i+1][j-1][k+1] +
               1.220f*A[t%2][i+1][j][k-1] +
               1.221f*A[t%2][i+1][j][k+1] +
               0.921f*A[t%2][i+1][j+1][k-1] +
               0.721f*A[t%2][i+1][j+1][k] +
               0.521f*A[t%2][i+1][j+1][k+1]) / 159;
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
