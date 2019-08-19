#include <assert.h>
#include <stdio.h>
#include "box3d2r-64x16-1-128_kernel.hu"
#define BENCH_DIM 3
#define BENCH_FPP 249
#define BENCH_RAD 2

#include "common.h"

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop)
{
  double start_time = sb_time(), end_time = 0.0;
  int dimsize = compsize + BENCH_RAD * 2;
  SB_TYPE (*A)[dimsize][dimsize][dimsize]
    = (SB_TYPE (*)[dimsize][dimsize][dimsize])A1;

  if (scop) {
    if (dimsize >= 5 && timestep >= 1) {
#define cudaCheckReturn(ret) \
  do { \
    cudaError_t cudaCheckReturn_e = (ret); \
    if (cudaCheckReturn_e != cudaSuccess) { \
      fprintf(stderr, "CUDA error: %s\n", cudaGetErrorString(cudaCheckReturn_e)); \
      fflush(stderr); \
    } \
    assert(cudaCheckReturn_e == cudaSuccess); \
  } while(0)
#define cudaCheckKernel() \
  do { \
    cudaCheckReturn(cudaGetLastError()); \
  } while(0)

      double *dev_A;
      
      cudaCheckReturn(cudaMalloc((void **) &dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double)));
      
{
      cudaCheckReturn(cudaMemcpy(dev_A, A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double), cudaMemcpyHostToDevice));
#ifdef STENCILBENCH
cudaDeviceSynchronize();
SB_START_INSTRUMENTS;
#endif
}
    {
#ifndef AN5D_TYPE
#define AN5D_TYPE unsigned
#endif
      const AN5D_TYPE __c0Len = (timestep - 0);
      const AN5D_TYPE __c0Pad = (0);
      #define __c0 c0
      const AN5D_TYPE __c1Len = (dimsize - 2 - 2);
      const AN5D_TYPE __c1Pad = (2);
      #define __c1 c1
      const AN5D_TYPE __c2Len = (dimsize - 2 - 2);
      const AN5D_TYPE __c2Pad = (2);
      #define __c2 c2
      const AN5D_TYPE __c3Len = (dimsize - 2 - 2);
      const AN5D_TYPE __c3Pad = (2);
      #define __c3 c3
      const AN5D_TYPE __halo1 = 2;
      const AN5D_TYPE __halo2 = 2;
      const AN5D_TYPE __halo3 = 2;
      AN5D_TYPE c0;
      AN5D_TYPE __side0LenMax;
      {
        const AN5D_TYPE __side0Len = 1;
        const AN5D_TYPE __side1Len = 128;
        const AN5D_TYPE __side2Len = 12;
        const AN5D_TYPE __side3Len = 60;
        const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
        const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
        const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
        const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
        const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
        const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
        const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
        assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
        dim3 k0_dimBlock(__blockSize, 1, 1);
        dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len) * ((__c3Len + __side3Len - 1) / __side3Len), 1, 1);
        AN5D_TYPE __c0Padr = (__c0Len % 2) != (((__c0Len + __side0Len - 1) / __side0Len) % 2) && __c0Len % __side0Len < 2 ? 1 : 0;
        __side0LenMax = __side0Len;
        for (c0 = __c0Pad; c0 < __c0Pad + __c0Len / __side0Len - __c0Padr; c0 += 1)
        {
          kernel0_1<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
      }
      if ((__c0Len % 2) != (((__c0Len + __side0LenMax - 1) / __side0LenMax) % 2))
      {
        if (__c0Len % __side0LenMax == 0)
        {
        }
      }
      else if (__c0Len % __side0LenMax)
      {
      }
    }
    cudaCheckKernel();
{
#ifdef STENCILBENCH
cudaDeviceSynchronize();
SB_STOP_INSTRUMENTS;
#endif
      cudaCheckReturn(cudaMemcpy(A, dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double), cudaMemcpyDeviceToHost));
}
      cudaCheckReturn(cudaFree(dev_A));
    }
  }
  else {
    for (int t = 0; t < timestep; t++)
#pragma omp parallel for
      for (int i = BENCH_RAD; i < dimsize - BENCH_RAD; i++)
        for (int j = BENCH_RAD; j < dimsize - BENCH_RAD; j++)
          for (int k = BENCH_RAD; k < dimsize - BENCH_RAD; k++)
            A[(t+1)%2][i][j][k] =
              -0.324f*A[t%2][i-2][j][k] +
              0.0020f*A[t%2][i-2][j-2][k-2] +
              0.0030f*A[t%2][i-2][j-2][k-1] +
              0.0040f*A[t%2][i-2][j-2][k] +
              0.0050f*A[t%2][i-2][j-2][k+1] +
              0.0060f*A[t%2][i-2][j-2][k+2] +
              0.0070f*A[t%2][i-2][j-1][k-2] +
              0.0080f*A[t%2][i-2][j-1][k-1] +
              0.0090f*A[t%2][i-2][j-1][k] +
              0.0100f*A[t%2][i-2][j-1][k+1] +
              0.0110f*A[t%2][i-2][j-1][k+2] +
              0.0120f*A[t%2][i-2][j][k-2] +
              0.0130f*A[t%2][i-2][j][k-1] +
              0.0140f*A[t%2][i-2][j][k+1] +
              0.0150f*A[t%2][i-2][j][k+2] +
              0.0160f*A[t%2][i-2][j+1][k-2] +
              0.0170f*A[t%2][i-2][j+1][k-1] +
              0.0180f*A[t%2][i-2][j+1][k] +
              0.0190f*A[t%2][i-2][j+1][k+1] +
              0.0200f*A[t%2][i-2][j+1][k+2] +
              0.0210f*A[t%2][i-2][j+2][k-2] +
              0.0220f*A[t%2][i-2][j+2][k-1] +
              0.0230f*A[t%2][i-2][j+2][k] +
              0.0240f*A[t%2][i-2][j+2][k+1] +
              0.0250f*A[t%2][i-2][j+2][k+2] -

              0.3264f*A[t%2][i-1][j][k] +
              0.0021f*A[t%2][i-1][j-2][k-2] +
              0.0031f*A[t%2][i-1][j-2][k-1] +
              0.0041f*A[t%2][i-1][j-2][k] +
              0.0051f*A[t%2][i-1][j-2][k+1] +
              0.0061f*A[t%2][i-1][j-2][k+2] +
              0.0071f*A[t%2][i-1][j-1][k-2] +
              0.0081f*A[t%2][i-1][j-1][k-1] +
              0.0091f*A[t%2][i-1][j-1][k] +
              0.0101f*A[t%2][i-1][j-1][k+1] +
              0.0111f*A[t%2][i-1][j-1][k+2] +
              0.0121f*A[t%2][i-1][j][k-2] +
              0.0131f*A[t%2][i-1][j][k-1] +
              0.0141f*A[t%2][i-1][j][k+1] +
              0.0151f*A[t%2][i-1][j][k+2] +
              0.0161f*A[t%2][i-1][j+1][k-2] +
              0.0171f*A[t%2][i-1][j+1][k-1] +
              0.0181f*A[t%2][i-1][j+1][k] +
              0.0191f*A[t%2][i-1][j+1][k+1] +
              0.0201f*A[t%2][i-1][j+1][k+2] +
              0.0211f*A[t%2][i-1][j+2][k-2] +
              0.0221f*A[t%2][i-1][j+2][k-1] +
              0.0231f*A[t%2][i-1][j+2][k] +
              0.0241f*A[t%2][i-1][j+2][k+1] +
              0.0251f*A[t%2][i-1][j+2][k+2] +

              0.6712f*A[t%2][i][j][k] +
              0.0022f*A[t%2][i][j-2][k-2] +
              0.0032f*A[t%2][i][j-2][k-1] +
              0.0042f*A[t%2][i][j-2][k] +
              0.0052f*A[t%2][i][j-2][k+1] +
              0.0062f*A[t%2][i][j-2][k+2] +
              0.0072f*A[t%2][i][j-1][k-2] +
              0.0082f*A[t%2][i][j-1][k-1] +
              0.0092f*A[t%2][i][j-1][k] +
              0.0102f*A[t%2][i][j-1][k+1] +
              0.0112f*A[t%2][i][j-1][k+2] +
              0.0122f*A[t%2][i][j][k-2] +
              0.0132f*A[t%2][i][j][k-1] +
              0.0142f*A[t%2][i][j][k+1] +
              0.0152f*A[t%2][i][j][k+2] +
              0.0162f*A[t%2][i][j+1][k-2] +
              0.0172f*A[t%2][i][j+1][k-1] +
              0.0182f*A[t%2][i][j+1][k] +
              0.0192f*A[t%2][i][j+1][k+1] +
              0.0202f*A[t%2][i][j+1][k+2] +
              0.0212f*A[t%2][i][j+2][k-2] +
              0.0222f*A[t%2][i][j+2][k-1] +
              0.0232f*A[t%2][i][j+2][k] +
              0.0242f*A[t%2][i][j+2][k+1] +
              0.0252f*A[t%2][i][j+2][k+2] -

              0.3312f*A[t%2][i+1][j][k] +
              0.0023f*A[t%2][i+1][j-2][k-2] +
              0.0033f*A[t%2][i+1][j-2][k-1] +
              0.0043f*A[t%2][i+1][j-2][k] +
              0.0053f*A[t%2][i+1][j-2][k+1] +
              0.0063f*A[t%2][i+1][j-2][k+2] +
              0.0073f*A[t%2][i+1][j-1][k-2] +
              0.0083f*A[t%2][i+1][j-1][k-1] +
              0.0093f*A[t%2][i+1][j-1][k] +
              0.0103f*A[t%2][i+1][j-1][k+1] +
              0.0113f*A[t%2][i+1][j-1][k+2] +
              0.0123f*A[t%2][i+1][j][k-2] +
              0.0133f*A[t%2][i+1][j][k-1] +
              0.0143f*A[t%2][i+1][j][k+1] +
              0.0153f*A[t%2][i+1][j][k+2] +
              0.0163f*A[t%2][i+1][j+1][k-2] +
              0.0173f*A[t%2][i+1][j+1][k-1] +
              0.0183f*A[t%2][i+1][j+1][k] +
              0.0193f*A[t%2][i+1][j+1][k+1] +
              0.0203f*A[t%2][i+1][j+1][k+2] +
              0.0213f*A[t%2][i+1][j+2][k-2] +
              0.0223f*A[t%2][i+1][j+2][k-1] +
              0.0233f*A[t%2][i+1][j+2][k] +
              0.0243f*A[t%2][i+1][j+2][k+1] +
              0.0253f*A[t%2][i+1][j+2][k+2] -

              0.3336f*A[t%2][i+2][j][k] +
              0.0024f*A[t%2][i+2][j-2][k-2] +
              0.0034f*A[t%2][i+2][j-2][k-1] +
              0.0044f*A[t%2][i+2][j-2][k] +
              0.0054f*A[t%2][i+2][j-2][k+1] +
              0.0064f*A[t%2][i+2][j-2][k+2] +
              0.0074f*A[t%2][i+2][j-1][k-2] +
              0.0084f*A[t%2][i+2][j-1][k-1] +
              0.0094f*A[t%2][i+2][j-1][k] +
              0.0104f*A[t%2][i+2][j-1][k+1] +
              0.0114f*A[t%2][i+2][j-1][k+2] +
              0.0124f*A[t%2][i+2][j][k-2] +
              0.0134f*A[t%2][i+2][j][k-1] +
              0.0144f*A[t%2][i+2][j][k+1] +
              0.0154f*A[t%2][i+2][j][k+2] +
              0.0164f*A[t%2][i+2][j+1][k-2] +
              0.0174f*A[t%2][i+2][j+1][k-1] +
              0.0184f*A[t%2][i+2][j+1][k] +
              0.0194f*A[t%2][i+2][j+1][k+1] +
              0.0204f*A[t%2][i+2][j+1][k+2] +
              0.0214f*A[t%2][i+2][j+2][k-2] +
              0.0224f*A[t%2][i+2][j+2][k-1] +
              0.0234f*A[t%2][i+2][j+2][k] +
              0.0244f*A[t%2][i+2][j+2][k+1] +
              0.0254f*A[t%2][i+2][j+2][k+2];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
