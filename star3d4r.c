#define BENCH_DIM 3
#define BENCH_FPP 49
#define BENCH_RAD 4

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
              0.25000f * A[t%2][i][j][k]
              + 0.03228f * A[t%2][i][j][k-4] + 0.03138f * A[t%2][i][j][k-3]
              + 0.03118f * A[t%2][i][j][k-2] + 0.03027f * A[t%2][i][j][k-1]
              + 0.03022f * A[t%2][i][j][k+1] + 0.03112f * A[t%2][i][j][k+2]
              + 0.03132f * A[t%2][i][j][k+3] + 0.03222f * A[t%2][i][j][k+4]

              + 0.03026f * A[t%2][i-1][j][k] + 0.03024f * A[t%2][i+1][j][k]
              + 0.03027f * A[t%2][i][j-1][k] + 0.03023f * A[t%2][i][j+1][k]

              + 0.03116f * A[t%2][i-2][j][k] + 0.03114f * A[t%2][i+2][j][k]
              + 0.03117f * A[t%2][i][j-2][k] + 0.03113f * A[t%2][i][j+2][k]

              + 0.03136f * A[t%2][i-3][j][k] + 0.03134f * A[t%2][i+3][j][k]
              + 0.03137f * A[t%2][i][j-3][k] + 0.03133f * A[t%2][i][j+3][k]

              + 0.03226f * A[t%2][i-4][j][k] + 0.03224f * A[t%2][i+4][j][k]
              + 0.03227f * A[t%2][i][j-4][k] + 0.03223f * A[t%2][i][j+4][k];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              0.25000f * A[t%2][i][j][k]
              + 0.03228f * A[t%2][i][j][k-4] + 0.03138f * A[t%2][i][j][k-3]
              + 0.03118f * A[t%2][i][j][k-2] + 0.03027f * A[t%2][i][j][k-1]
              + 0.03022f * A[t%2][i][j][k+1] + 0.03112f * A[t%2][i][j][k+2]
              + 0.03132f * A[t%2][i][j][k+3] + 0.03222f * A[t%2][i][j][k+4]

              + 0.03026f * A[t%2][i-1][j][k] + 0.03024f * A[t%2][i+1][j][k]
              + 0.03027f * A[t%2][i][j-1][k] + 0.03023f * A[t%2][i][j+1][k]

              + 0.03116f * A[t%2][i-2][j][k] + 0.03114f * A[t%2][i+2][j][k]
              + 0.03117f * A[t%2][i][j-2][k] + 0.03113f * A[t%2][i][j+2][k]

              + 0.03136f * A[t%2][i-3][j][k] + 0.03134f * A[t%2][i+3][j][k]
              + 0.03137f * A[t%2][i][j-3][k] + 0.03133f * A[t%2][i][j+3][k]

              + 0.03226f * A[t%2][i-4][j][k] + 0.03224f * A[t%2][i+4][j][k]
              + 0.03227f * A[t%2][i][j-4][k] + 0.03223f * A[t%2][i][j+4][k];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
