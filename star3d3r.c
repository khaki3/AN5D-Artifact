#define BENCH_DIM 3
#define BENCH_FPP 37
#define BENCH_RAD 3

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

              + 0.04276f * A[t%2][i][j][k-3] + 0.04176f * A[t%2][i][j][k-2]
              + 0.04076f * A[t%2][i][j][k-1] + 0.04046f * A[t%2][i][j][k+1]
              + 0.04146f * A[t%2][i][j][k+2] + 0.04246f * A[t%2][i][j][k+3]

              + 0.04096f * A[t%2][i-1][j][k] + 0.04066f * A[t%2][i+1][j][k]
              + 0.04086f * A[t%2][i][j-1][k] + 0.04056f * A[t%2][i][j+1][k]

              + 0.04196f * A[t%2][i-2][j][k] + 0.04166f * A[t%2][i+2][j][k]
              + 0.04186f * A[t%2][i][j-2][k] + 0.04156f * A[t%2][i][j+2][k]

              + 0.04296f * A[t%2][i-3][j][k] + 0.04266f * A[t%2][i+3][j][k]
              + 0.04286f * A[t%2][i][j-3][k] + 0.04256f * A[t%2][i][j+3][k];
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

              + 0.04276f * A[t%2][i][j][k-3] + 0.04176f * A[t%2][i][j][k-2]
              + 0.04076f * A[t%2][i][j][k-1] + 0.04046f * A[t%2][i][j][k+1]
              + 0.04146f * A[t%2][i][j][k+2] + 0.04246f * A[t%2][i][j][k+3]

              + 0.04096f * A[t%2][i-1][j][k] + 0.04066f * A[t%2][i+1][j][k]
              + 0.04086f * A[t%2][i][j-1][k] + 0.04056f * A[t%2][i][j+1][k]

              + 0.04196f * A[t%2][i-2][j][k] + 0.04166f * A[t%2][i+2][j][k]
              + 0.04186f * A[t%2][i][j-2][k] + 0.04156f * A[t%2][i][j+2][k]

              + 0.04296f * A[t%2][i-3][j][k] + 0.04266f * A[t%2][i+3][j][k]
              + 0.04286f * A[t%2][i][j-3][k] + 0.04256f * A[t%2][i][j+3][k];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
