#define BENCH_DIM 2
#define BENCH_FPP 97
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
            0.01530f * A[t%2][i-3][j-3] +
            0.01531f * A[t%2][i-3][j-2] +
            0.01532f * A[t%2][i-3][j-1] +
            0.01533f * A[t%2][i-3][j] +
            0.01534f * A[t%2][i-3][j+1] +
            0.01535f * A[t%2][i-3][j+2] +
            0.01536f * A[t%2][i-3][j+3] +

            0.01537f * A[t%2][i-2][j-3] +
            0.01538f * A[t%2][i-2][j-2] +
            0.01539f * A[t%2][i-2][j-1] +
            0.01540f * A[t%2][i-2][j] +
            0.01541f * A[t%2][i-2][j+1] +
            0.01542f * A[t%2][i-2][j+2] +
            0.01543f * A[t%2][i-2][j+3] +

            0.01544f * A[t%2][i-1][j-3] +
            0.01545f * A[t%2][i-1][j-2] +
            0.01546f * A[t%2][i-1][j-1] +
            0.01546f * A[t%2][i-1][j] +
            0.01547f * A[t%2][i-1][j+1] +
            0.01548f * A[t%2][i-1][j+2] +
            0.01549f * A[t%2][i-1][j+3] +

            0.01550f * A[t%2][i][j-3] +
            0.01551f * A[t%2][i][j-2] +
            0.01552f * A[t%2][i][j-1] +
            0.25424f * A[t%2][i][j] +
            0.01554f * A[t%2][i][j+1] +
            0.01555f * A[t%2][i][j+2] +
            0.01556f * A[t%2][i][j+3] +

            0.01557f * A[t%2][i+1][j-3] +
            0.01558f * A[t%2][i+1][j-2] +
            0.01559f * A[t%2][i+1][j-1] +
            0.01560f * A[t%2][i+1][j] +
            0.01561f * A[t%2][i+1][j+1] +
            0.01562f * A[t%2][i+1][j+2] +
            0.01564f * A[t%2][i+1][j+3] +

            0.01565f * A[t%2][i+2][j-3] +
            0.01566f * A[t%2][i+2][j-2] +
            0.01567f * A[t%2][i+2][j-1] +
            0.01568f * A[t%2][i+2][j] +
            0.01569f * A[t%2][i+2][j+1] +
            0.01570f * A[t%2][i+2][j+2] +
            0.01571f * A[t%2][i+2][j+3] +

            0.01572f * A[t%2][i+3][j-3] +
            0.01573f * A[t%2][i+3][j-2] +
            0.01574f * A[t%2][i+3][j-1] +
            0.01575f * A[t%2][i+3][j] +
            0.01576f * A[t%2][i+3][j+1] +
            0.01577f * A[t%2][i+3][j+2] +
            0.01578f * A[t%2][i+3][j+3];
#pragma endscop
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          A[(t+1)%2][i][j] =
            0.01530f * A[t%2][i-3][j-3] +
            0.01531f * A[t%2][i-3][j-2] +
            0.01532f * A[t%2][i-3][j-1] +
            0.01533f * A[t%2][i-3][j] +
            0.01534f * A[t%2][i-3][j+1] +
            0.01535f * A[t%2][i-3][j+2] +
            0.01536f * A[t%2][i-3][j+3] +

            0.01537f * A[t%2][i-2][j-3] +
            0.01538f * A[t%2][i-2][j-2] +
            0.01539f * A[t%2][i-2][j-1] +
            0.01540f * A[t%2][i-2][j] +
            0.01541f * A[t%2][i-2][j+1] +
            0.01542f * A[t%2][i-2][j+2] +
            0.01543f * A[t%2][i-2][j+3] +

            0.01544f * A[t%2][i-1][j-3] +
            0.01545f * A[t%2][i-1][j-2] +
            0.01546f * A[t%2][i-1][j-1] +
            0.01546f * A[t%2][i-1][j] +
            0.01547f * A[t%2][i-1][j+1] +
            0.01548f * A[t%2][i-1][j+2] +
            0.01549f * A[t%2][i-1][j+3] +

            0.01550f * A[t%2][i][j-3] +
            0.01551f * A[t%2][i][j-2] +
            0.01552f * A[t%2][i][j-1] +
            0.25424f * A[t%2][i][j] +
            0.01554f * A[t%2][i][j+1] +
            0.01555f * A[t%2][i][j+2] +
            0.01556f * A[t%2][i][j+3] +

            0.01557f * A[t%2][i+1][j-3] +
            0.01558f * A[t%2][i+1][j-2] +
            0.01559f * A[t%2][i+1][j-1] +
            0.01560f * A[t%2][i+1][j] +
            0.01561f * A[t%2][i+1][j+1] +
            0.01562f * A[t%2][i+1][j+2] +
            0.01564f * A[t%2][i+1][j+3] +

            0.01565f * A[t%2][i+2][j-3] +
            0.01566f * A[t%2][i+2][j-2] +
            0.01567f * A[t%2][i+2][j-1] +
            0.01568f * A[t%2][i+2][j] +
            0.01569f * A[t%2][i+2][j+1] +
            0.01570f * A[t%2][i+2][j+2] +
            0.01571f * A[t%2][i+2][j+3] +

            0.01572f * A[t%2][i+3][j-3] +
            0.01573f * A[t%2][i+3][j-2] +
            0.01574f * A[t%2][i+3][j-1] +
            0.01575f * A[t%2][i+3][j] +
            0.01576f * A[t%2][i+3][j+1] +
            0.01577f * A[t%2][i+3][j+2] +
            0.01578f * A[t%2][i+3][j+3];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
