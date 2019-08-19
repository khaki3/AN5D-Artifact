#define BENCH_DIM 3
#define BENCH_FPP 25
#define BENCH_RAD 2

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
              0.2500f * A[t%2][i][j][k]
              + 0.0620f * A[t%2][i-1][j][k] + 0.0621f * A[t%2][i+1][j][k]
              + 0.0622f * A[t%2][i][j-1][k] + 0.0623f * A[t%2][i][j+1][k]
              + 0.0624f * A[t%2][i][j][k-1] + 0.06245f * A[t%2][i][j][k+1]

              + 0.06255f * A[t%2][i-2][j][k] + 0.0626f * A[t%2][i+2][j][k]
              + 0.0627f  * A[t%2][i][j-2][k] + 0.0628f * A[t%2][i][j+2][k]
              + 0.0629f  * A[t%2][i][j][k-2] + 0.0630f * A[t%2][i][j][k+2];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              0.2500f * A[t%2][i][j][k]
              + 0.0620f * A[t%2][i-1][j][k] + 0.0621f * A[t%2][i+1][j][k]
              + 0.0622f * A[t%2][i][j-1][k] + 0.0623f * A[t%2][i][j+1][k]
              + 0.0624f * A[t%2][i][j][k-1] + 0.06245f * A[t%2][i][j][k+1]

              + 0.06255f * A[t%2][i-2][j][k] + 0.0626f * A[t%2][i+2][j][k]
              + 0.0627f  * A[t%2][i][j-2][k] + 0.0628f * A[t%2][i][j+2][k]
              + 0.0629f  * A[t%2][i][j][k-2] + 0.0630f * A[t%2][i][j][k+2];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
