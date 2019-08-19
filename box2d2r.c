#define BENCH_DIM 2
#define BENCH_FPP 49
#define BENCH_RAD 2

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
            0.03125f * A[t%2][i-2][j-2] +
            0.03126f * A[t%2][i-2][j-1] +
            0.03127f * A[t%2][i-2][j] +
            0.03128f * A[t%2][i-2][j+1] +
            0.03129f * A[t%2][i-2][j+2] +

            0.03130f * A[t%2][i-1][j-2] +
            0.03131f * A[t%2][i-1][j-1] +
            0.03132f * A[t%2][i-1][j] +
            0.03133f * A[t%2][i-1][j+1] +
            0.03134f * A[t%2][i-1][j+2] +

            0.03135f * A[t%2][i][j-2] +
            0.03136f * A[t%2][i][j-1] +
            0.24712f * A[t%2][i][j] +
            0.03138f * A[t%2][i][j+1] +
            0.03139f * A[t%2][i][j+2] +

            0.03140f * A[t%2][i+1][j-2] +
            0.03141f * A[t%2][i+1][j-1] +
            0.03142f * A[t%2][i+1][j] +
            0.03143f * A[t%2][i+1][j+1] +
            0.03144f * A[t%2][i+1][j+2] +

            0.03145f * A[t%2][i+2][j-2] +
            0.03146f * A[t%2][i+2][j-1] +
            0.03147f * A[t%2][i+2][j] +
            0.03148f * A[t%2][i+2][j+1] +
            0.03149f * A[t%2][i+2][j+2];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          A[(t+1)%2][i][j] =
            0.03125f * A[t%2][i-2][j-2] +
            0.03126f * A[t%2][i-2][j-1] +
            0.03127f * A[t%2][i-2][j] +
            0.03128f * A[t%2][i-2][j+1] +
            0.03129f * A[t%2][i-2][j+2] +

            0.03130f * A[t%2][i-1][j-2] +
            0.03131f * A[t%2][i-1][j-1] +
            0.03132f * A[t%2][i-1][j] +
            0.03133f * A[t%2][i-1][j+1] +
            0.03134f * A[t%2][i-1][j+2] +

            0.03135f * A[t%2][i][j-2] +
            0.03136f * A[t%2][i][j-1] +
            0.24712f * A[t%2][i][j] +
            0.03138f * A[t%2][i][j+1] +
            0.03139f * A[t%2][i][j+2] +

            0.03140f * A[t%2][i+1][j-2] +
            0.03141f * A[t%2][i+1][j-1] +
            0.03142f * A[t%2][i+1][j] +
            0.03143f * A[t%2][i+1][j+1] +
            0.03144f * A[t%2][i+1][j+2] +

            0.03145f * A[t%2][i+2][j-2] +
            0.03146f * A[t%2][i+2][j-1] +
            0.03147f * A[t%2][i+2][j] +
            0.03148f * A[t%2][i+2][j+1] +
            0.03149f * A[t%2][i+2][j+2];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
