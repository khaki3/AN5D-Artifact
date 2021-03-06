#include <assert.h>
#include <stdio.h>
#include "box3d3r-32x32-1-128_kernel.hu"
#define BENCH_DIM 3
#define BENCH_FPP 685
#define BENCH_RAD 3

#include "common.h"

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop)
{
  double start_time = sb_time(), end_time = 0.0;
  int dimsize = compsize + BENCH_RAD * 2;
  SB_TYPE (*A)[dimsize][dimsize][dimsize]
    = (SB_TYPE (*)[dimsize][dimsize][dimsize])A1;

  if (scop) {
    if (dimsize >= 7 && timestep >= 1) {
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

      float *dev_A;
      
      cudaCheckReturn(cudaMalloc((void **) &dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float)));
      
{
      cudaCheckReturn(cudaMemcpy(dev_A, A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float), cudaMemcpyHostToDevice));
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
      const AN5D_TYPE __c1Len = (dimsize - 3 - 3);
      const AN5D_TYPE __c1Pad = (3);
      #define __c1 c1
      const AN5D_TYPE __c2Len = (dimsize - 3 - 3);
      const AN5D_TYPE __c2Pad = (3);
      #define __c2 c2
      const AN5D_TYPE __c3Len = (dimsize - 3 - 3);
      const AN5D_TYPE __c3Pad = (3);
      #define __c3 c3
      const AN5D_TYPE __halo1 = 3;
      const AN5D_TYPE __halo2 = 3;
      const AN5D_TYPE __halo3 = 3;
      AN5D_TYPE c0;
      AN5D_TYPE __side0LenMax;
      {
        const AN5D_TYPE __side0Len = 1;
        const AN5D_TYPE __side1Len = 128;
        const AN5D_TYPE __side2Len = 26;
        const AN5D_TYPE __side3Len = 26;
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
      cudaCheckReturn(cudaMemcpy(A, dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float), cudaMemcpyDeviceToHost));
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
              -0.176f*A[t%2][i-3][j][k] +
              0.0010f*A[t%2][i-3][j-3][k-3] +
              0.0020f*A[t%2][i-3][j-3][k-2] +
              0.0030f*A[t%2][i-3][j-3][k-1] +
              0.0040f*A[t%2][i-3][j-3][k] +
              0.0050f*A[t%2][i-3][j-3][k+1] +
              0.0060f*A[t%2][i-3][j-3][k+2] +
              0.0070f*A[t%2][i-3][j-3][k+3] +
              0.0080f*A[t%2][i-3][j-2][k-3] +
              0.0090f*A[t%2][i-3][j-2][k-2] +
              0.0100f*A[t%2][i-3][j-2][k-1] +
              0.0110f*A[t%2][i-3][j-2][k] +
              0.0120f*A[t%2][i-3][j-2][k+1] +
              0.0130f*A[t%2][i-3][j-2][k+2] +
              0.0140f*A[t%2][i-3][j-2][k+3] +
              0.0150f*A[t%2][i-3][j-1][k-3] +
              0.0160f*A[t%2][i-3][j-1][k-2] +
              0.0170f*A[t%2][i-3][j-1][k-1] +
              0.0180f*A[t%2][i-3][j-1][k] +
              0.0190f*A[t%2][i-3][j-1][k+1] +
              0.0200f*A[t%2][i-3][j-1][k+2] +
              0.0210f*A[t%2][i-3][j-1][k+3] +
              0.0220f*A[t%2][i-3][j][k-3] +
              0.0230f*A[t%2][i-3][j][k-2] +
              0.0240f*A[t%2][i-3][j][k-1] +
              0.0250f*A[t%2][i-3][j][k+1] +
              0.0260f*A[t%2][i-3][j][k+2] +
              0.0270f*A[t%2][i-3][j][k+3] +
              0.0280f*A[t%2][i-3][j+1][k-3] +
              0.0290f*A[t%2][i-3][j+1][k-2] +
              0.0300f*A[t%2][i-3][j+1][k-1] +
              0.0310f*A[t%2][i-3][j+1][k] +
              0.0320f*A[t%2][i-3][j+1][k+1] +
              0.0330f*A[t%2][i-3][j+1][k+2] +
              0.0340f*A[t%2][i-3][j+1][k+3] +
              0.0350f*A[t%2][i-3][j+2][k-3] +
              0.0360f*A[t%2][i-3][j+2][k-2] +
              0.0370f*A[t%2][i-3][j+2][k-1] +
              0.0380f*A[t%2][i-3][j+2][k] +
              0.0390f*A[t%2][i-3][j+2][k+1] +
              0.0400f*A[t%2][i-3][j+2][k+2] +
              0.0410f*A[t%2][i-3][j+2][k+3] +
              0.0420f*A[t%2][i-3][j+3][k-3] +
              0.0430f*A[t%2][i-3][j+3][k-2] +
              0.0440f*A[t%2][i-3][j+3][k-1] +
              0.0450f*A[t%2][i-3][j+3][k] +
              0.0460f*A[t%2][i-3][j+3][k+1] +
              0.0470f*A[t%2][i-3][j+3][k+2] +
              0.0480f*A[t%2][i-3][j+3][k+3] +

              0.1808f*A[t%2][i-2][j][k] -
              0.0011f*A[t%2][i-2][j-3][k-3] -
              0.0021f*A[t%2][i-2][j-3][k-2] -
              0.0031f*A[t%2][i-2][j-3][k-1] -
              0.0041f*A[t%2][i-2][j-3][k] -
              0.0051f*A[t%2][i-2][j-3][k+1] -
              0.0061f*A[t%2][i-2][j-3][k+2] -
              0.0071f*A[t%2][i-2][j-3][k+3] -
              0.0081f*A[t%2][i-2][j-2][k-3] -
              0.0091f*A[t%2][i-2][j-2][k-2] -
              0.0101f*A[t%2][i-2][j-2][k-1] -
              0.0111f*A[t%2][i-2][j-2][k] -
              0.0121f*A[t%2][i-2][j-2][k+1] -
              0.0131f*A[t%2][i-2][j-2][k+2] -
              0.0141f*A[t%2][i-2][j-2][k+3] -
              0.0151f*A[t%2][i-2][j-1][k-3] -
              0.0161f*A[t%2][i-2][j-1][k-2] -
              0.0171f*A[t%2][i-2][j-1][k-1] -
              0.0181f*A[t%2][i-2][j-1][k] -
              0.0191f*A[t%2][i-2][j-1][k+1] -
              0.0201f*A[t%2][i-2][j-1][k+2] -
              0.0211f*A[t%2][i-2][j-1][k+3] -
              0.0221f*A[t%2][i-2][j][k-3] -
              0.0231f*A[t%2][i-2][j][k-2] -
              0.0241f*A[t%2][i-2][j][k-1] -
              0.0251f*A[t%2][i-2][j][k+1] -
              0.0261f*A[t%2][i-2][j][k+2] -
              0.0271f*A[t%2][i-2][j][k+3] -
              0.0281f*A[t%2][i-2][j+1][k-3] -
              0.0291f*A[t%2][i-2][j+1][k-2] -
              0.0301f*A[t%2][i-2][j+1][k-1] -
              0.0311f*A[t%2][i-2][j+1][k] -
              0.0321f*A[t%2][i-2][j+1][k+1] -
              0.0331f*A[t%2][i-2][j+1][k+2] -
              0.0341f*A[t%2][i-2][j+1][k+3] -
              0.0351f*A[t%2][i-2][j+2][k-3] -
              0.0361f*A[t%2][i-2][j+2][k-2] -
              0.0371f*A[t%2][i-2][j+2][k-1] -
              0.0381f*A[t%2][i-2][j+2][k] -
              0.0391f*A[t%2][i-2][j+2][k+1] -
              0.0401f*A[t%2][i-2][j+2][k+2] -
              0.0411f*A[t%2][i-2][j+2][k+3] -
              0.0421f*A[t%2][i-2][j+3][k-3] -
              0.0431f*A[t%2][i-2][j+3][k-2] -
              0.0441f*A[t%2][i-2][j+3][k-1] -
              0.0451f*A[t%2][i-2][j+3][k] -
              0.0461f*A[t%2][i-2][j+3][k+1] -
              0.0471f*A[t%2][i-2][j+3][k+2] -
              0.0481f*A[t%2][i-2][j+3][k+3] +

              -0.1856f*A[t%2][i-1][j][k] +
              0.0012f*A[t%2][i-1][j-3][k-3] +
              0.0022f*A[t%2][i-1][j-3][k-2] +
              0.0032f*A[t%2][i-1][j-3][k-1] +
              0.0042f*A[t%2][i-1][j-3][k] +
              0.0052f*A[t%2][i-1][j-3][k+1] +
              0.0062f*A[t%2][i-1][j-3][k+2] +
              0.0072f*A[t%2][i-1][j-3][k+3] +
              0.0082f*A[t%2][i-1][j-2][k-3] +
              0.0092f*A[t%2][i-1][j-2][k-2] +
              0.0102f*A[t%2][i-1][j-2][k-1] +
              0.0112f*A[t%2][i-1][j-2][k] +
              0.0122f*A[t%2][i-1][j-2][k+1] +
              0.0132f*A[t%2][i-1][j-2][k+2] +
              0.0142f*A[t%2][i-1][j-2][k+3] +
              0.0152f*A[t%2][i-1][j-1][k-3] +
              0.0162f*A[t%2][i-1][j-1][k-2] +
              0.0172f*A[t%2][i-1][j-1][k-1] +
              0.0182f*A[t%2][i-1][j-1][k] +
              0.0192f*A[t%2][i-1][j-1][k+1] +
              0.0202f*A[t%2][i-1][j-1][k+2] +
              0.0212f*A[t%2][i-1][j-1][k+3] +
              0.0222f*A[t%2][i-1][j][k-3] +
              0.0232f*A[t%2][i-1][j][k-2] +
              0.0242f*A[t%2][i-1][j][k-1] +
              0.0252f*A[t%2][i-1][j][k+1] +
              0.0262f*A[t%2][i-1][j][k+2] +
              0.0272f*A[t%2][i-1][j][k+3] +
              0.0282f*A[t%2][i-1][j+1][k-3] +
              0.0292f*A[t%2][i-1][j+1][k-2] +
              0.0302f*A[t%2][i-1][j+1][k-1] +
              0.0312f*A[t%2][i-1][j+1][k] +
              0.0322f*A[t%2][i-1][j+1][k+1] +
              0.0332f*A[t%2][i-1][j+1][k+2] +
              0.0342f*A[t%2][i-1][j+1][k+3] +
              0.0352f*A[t%2][i-1][j+2][k-3] +
              0.0362f*A[t%2][i-1][j+2][k-2] +
              0.0372f*A[t%2][i-1][j+2][k-1] +
              0.0382f*A[t%2][i-1][j+2][k] +
              0.0392f*A[t%2][i-1][j+2][k+1] +
              0.0402f*A[t%2][i-1][j+2][k+2] +
              0.0412f*A[t%2][i-1][j+2][k+3] +
              0.0422f*A[t%2][i-1][j+3][k-3] +
              0.0432f*A[t%2][i-1][j+3][k-2] +
              0.0442f*A[t%2][i-1][j+3][k-1] +
              0.0452f*A[t%2][i-1][j+3][k] +
              0.0462f*A[t%2][i-1][j+3][k+1] +
              0.0472f*A[t%2][i-1][j+3][k+2] +
              0.0482f*A[t%2][i-1][j+3][k+3] +

              -0.1904f*A[t%2][i][j][k] +
              0.0013f*A[t%2][i][j-3][k-3] +
              0.0023f*A[t%2][i][j-3][k-2] +
              0.0033f*A[t%2][i][j-3][k-1] +
              0.0043f*A[t%2][i][j-3][k] +
              0.0053f*A[t%2][i][j-3][k+1] +
              0.0063f*A[t%2][i][j-3][k+2] +
              0.0073f*A[t%2][i][j-3][k+3] +
              0.0083f*A[t%2][i][j-2][k-3] +
              0.0093f*A[t%2][i][j-2][k-2] +
              0.0103f*A[t%2][i][j-2][k-1] +
              0.0113f*A[t%2][i][j-2][k] +
              0.0123f*A[t%2][i][j-2][k+1] +
              0.0133f*A[t%2][i][j-2][k+2] +
              0.0143f*A[t%2][i][j-2][k+3] +
              0.0153f*A[t%2][i][j-1][k-3] +
              0.0163f*A[t%2][i][j-1][k-2] +
              0.0173f*A[t%2][i][j-1][k-1] +
              0.0183f*A[t%2][i][j-1][k] +
              0.0193f*A[t%2][i][j-1][k+1] +
              0.0203f*A[t%2][i][j-1][k+2] +
              0.0213f*A[t%2][i][j-1][k+3] +
              0.0223f*A[t%2][i][j][k-3] +
              0.0233f*A[t%2][i][j][k-2] +
              0.0243f*A[t%2][i][j][k-1] +
              0.0253f*A[t%2][i][j][k+1] +
              0.0263f*A[t%2][i][j][k+2] +
              0.0273f*A[t%2][i][j][k+3] +
              0.0283f*A[t%2][i][j+1][k-3] +
              0.0293f*A[t%2][i][j+1][k-2] +
              0.0303f*A[t%2][i][j+1][k-1] +
              0.0313f*A[t%2][i][j+1][k] +
              0.0323f*A[t%2][i][j+1][k+1] +
              0.0333f*A[t%2][i][j+1][k+2] +
              0.0343f*A[t%2][i][j+1][k+3] +
              0.0353f*A[t%2][i][j+2][k-3] +
              0.0363f*A[t%2][i][j+2][k-2] +
              0.0373f*A[t%2][i][j+2][k-1] +
              0.0383f*A[t%2][i][j+2][k] +
              0.0393f*A[t%2][i][j+2][k+1] +
              0.0403f*A[t%2][i][j+2][k+2] +
              0.0413f*A[t%2][i][j+2][k+3] +
              0.0423f*A[t%2][i][j+3][k-3] +
              0.0433f*A[t%2][i][j+3][k-2] +
              0.0443f*A[t%2][i][j+3][k-1] +
              0.0453f*A[t%2][i][j+3][k] +
              0.0463f*A[t%2][i][j+3][k+1] +
              0.0473f*A[t%2][i][j+3][k+2] +
              0.0483f*A[t%2][i][j+3][k+3] +

              0.1952f*A[t%2][i+1][j][k] -
              0.0014f*A[t%2][i+1][j-3][k-3] -
              0.0024f*A[t%2][i+1][j-3][k-2] -
              0.0034f*A[t%2][i+1][j-3][k-1] -
              0.0044f*A[t%2][i+1][j-3][k] -
              0.0054f*A[t%2][i+1][j-3][k+1] -
              0.0064f*A[t%2][i+1][j-3][k+2] -
              0.0074f*A[t%2][i+1][j-3][k+3] -
              0.0084f*A[t%2][i+1][j-2][k-3] -
              0.0094f*A[t%2][i+1][j-2][k-2] -
              0.0104f*A[t%2][i+1][j-2][k-1] -
              0.0114f*A[t%2][i+1][j-2][k] -
              0.0124f*A[t%2][i+1][j-2][k+1] -
              0.0134f*A[t%2][i+1][j-2][k+2] -
              0.0144f*A[t%2][i+1][j-2][k+3] -
              0.0154f*A[t%2][i+1][j-1][k-3] -
              0.0164f*A[t%2][i+1][j-1][k-2] -
              0.0174f*A[t%2][i+1][j-1][k-1] -
              0.0184f*A[t%2][i+1][j-1][k] -
              0.0194f*A[t%2][i+1][j-1][k+1] -
              0.0204f*A[t%2][i+1][j-1][k+2] -
              0.0214f*A[t%2][i+1][j-1][k+3] -
              0.0224f*A[t%2][i+1][j][k-3] -
              0.0234f*A[t%2][i+1][j][k-2] -
              0.0244f*A[t%2][i+1][j][k-1] -
              0.0254f*A[t%2][i+1][j][k+1] -
              0.0264f*A[t%2][i+1][j][k+2] -
              0.0274f*A[t%2][i+1][j][k+3] -
              0.0284f*A[t%2][i+1][j+1][k-3] -
              0.0294f*A[t%2][i+1][j+1][k-2] -
              0.0304f*A[t%2][i+1][j+1][k-1] -
              0.0314f*A[t%2][i+1][j+1][k] -
              0.0324f*A[t%2][i+1][j+1][k+1] -
              0.0334f*A[t%2][i+1][j+1][k+2] -
              0.0344f*A[t%2][i+1][j+1][k+3] -
              0.0354f*A[t%2][i+1][j+2][k-3] -
              0.0364f*A[t%2][i+1][j+2][k-2] -
              0.0374f*A[t%2][i+1][j+2][k-1] -
              0.0384f*A[t%2][i+1][j+2][k] -
              0.0394f*A[t%2][i+1][j+2][k+1] -
              0.0404f*A[t%2][i+1][j+2][k+2] -
              0.0414f*A[t%2][i+1][j+2][k+3] -
              0.0424f*A[t%2][i+1][j+3][k-3] -
              0.0434f*A[t%2][i+1][j+3][k-2] -
              0.0444f*A[t%2][i+1][j+3][k-1] -
              0.0454f*A[t%2][i+1][j+3][k] -
              0.0464f*A[t%2][i+1][j+3][k+1] -
              0.0474f*A[t%2][i+1][j+3][k+2] -
              0.0484f*A[t%2][i+1][j+3][k+3] -

              -0.300f*A[t%2][i+2][j][k] +
              0.0015f*A[t%2][i+2][j-3][k-3] +
              0.0025f*A[t%2][i+2][j-3][k-2] +
              0.0035f*A[t%2][i+2][j-3][k-1] +
              0.0045f*A[t%2][i+2][j-3][k] +
              0.0055f*A[t%2][i+2][j-3][k+1] +
              0.0065f*A[t%2][i+2][j-3][k+2] +
              0.0075f*A[t%2][i+2][j-3][k+3] +
              0.0085f*A[t%2][i+2][j-2][k-3] +
              0.0095f*A[t%2][i+2][j-2][k-2] +
              0.0105f*A[t%2][i+2][j-2][k-1] +
              0.0115f*A[t%2][i+2][j-2][k] +
              0.0125f*A[t%2][i+2][j-2][k+1] +
              0.0135f*A[t%2][i+2][j-2][k+2] +
              0.0145f*A[t%2][i+2][j-2][k+3] +
              0.0155f*A[t%2][i+2][j-1][k-3] +
              0.0165f*A[t%2][i+2][j-1][k-2] +
              0.0175f*A[t%2][i+2][j-1][k-1] +
              0.0185f*A[t%2][i+2][j-1][k] +
              0.0195f*A[t%2][i+2][j-1][k+1] +
              0.0205f*A[t%2][i+2][j-1][k+2] +
              0.0215f*A[t%2][i+2][j-1][k+3] +
              0.0225f*A[t%2][i+2][j][k-3] +
              0.0235f*A[t%2][i+2][j][k-2] +
              0.0245f*A[t%2][i+2][j][k-1] +
              0.0255f*A[t%2][i+2][j][k+1] +
              0.0265f*A[t%2][i+2][j][k+2] +
              0.0275f*A[t%2][i+2][j][k+3] +
              0.0285f*A[t%2][i+2][j+1][k-3] +
              0.0295f*A[t%2][i+2][j+1][k-2] +
              0.0305f*A[t%2][i+2][j+1][k-1] +
              0.0315f*A[t%2][i+2][j+1][k] +
              0.0325f*A[t%2][i+2][j+1][k+1] +
              0.0335f*A[t%2][i+2][j+1][k+2] +
              0.0345f*A[t%2][i+2][j+1][k+3] +
              0.0355f*A[t%2][i+2][j+2][k-3] +
              0.0365f*A[t%2][i+2][j+2][k-2] +
              0.0375f*A[t%2][i+2][j+2][k-1] +
              0.0385f*A[t%2][i+2][j+2][k] +
              0.0395f*A[t%2][i+2][j+2][k+1] +
              0.0405f*A[t%2][i+2][j+2][k+2] +
              0.0415f*A[t%2][i+2][j+2][k+3] +
              0.0425f*A[t%2][i+2][j+3][k-3] +
              0.0435f*A[t%2][i+2][j+3][k-2] +
              0.0445f*A[t%2][i+2][j+3][k-1] +
              0.0455f*A[t%2][i+2][j+3][k] +
              0.0465f*A[t%2][i+2][j+3][k+1] +
              0.0475f*A[t%2][i+2][j+3][k+2] +
              0.1485f*A[t%2][i+2][j+3][k+3] +

              0.2048f*A[t%2][i+3][j][k] -
              0.0016f*A[t%2][i+3][j-3][k-3] -
              0.0026f*A[t%2][i+3][j-3][k-2] -
              0.0036f*A[t%2][i+3][j-3][k-1] -
              0.0046f*A[t%2][i+3][j-3][k] -
              0.0056f*A[t%2][i+3][j-3][k+1] -
              0.0066f*A[t%2][i+3][j-3][k+2] -
              0.0076f*A[t%2][i+3][j-3][k+3] -
              0.0086f*A[t%2][i+3][j-2][k-3] -
              0.0096f*A[t%2][i+3][j-2][k-2] -
              0.0106f*A[t%2][i+3][j-2][k-1] -
              0.0116f*A[t%2][i+3][j-2][k] -
              0.0126f*A[t%2][i+3][j-2][k+1] -
              0.0136f*A[t%2][i+3][j-2][k+2] -
              0.0146f*A[t%2][i+3][j-2][k+3] -
              0.0156f*A[t%2][i+3][j-1][k-3] -
              0.0166f*A[t%2][i+3][j-1][k-2] -
              0.0176f*A[t%2][i+3][j-1][k-1] -
              0.0186f*A[t%2][i+3][j-1][k] -
              0.0196f*A[t%2][i+3][j-1][k+1] -
              0.0206f*A[t%2][i+3][j-1][k+2] -
              0.0216f*A[t%2][i+3][j-1][k+3] -
              0.0226f*A[t%2][i+3][j][k-3] -
              0.0236f*A[t%2][i+3][j][k-2] -
              0.0246f*A[t%2][i+3][j][k-1] -
              0.0256f*A[t%2][i+3][j][k+1] -
              0.0266f*A[t%2][i+3][j][k+2] -
              0.0276f*A[t%2][i+3][j][k+3] -
              0.0286f*A[t%2][i+3][j+1][k-3] -
              0.0296f*A[t%2][i+3][j+1][k-2] -
              0.0306f*A[t%2][i+3][j+1][k-1] -
              0.0316f*A[t%2][i+3][j+1][k] -
              0.0326f*A[t%2][i+3][j+1][k+1] -
              0.0336f*A[t%2][i+3][j+1][k+2] -
              0.0346f*A[t%2][i+3][j+1][k+3] -
              0.0356f*A[t%2][i+3][j+2][k-3] -
              0.0366f*A[t%2][i+3][j+2][k-2] -
              0.0376f*A[t%2][i+3][j+2][k-1] -
              0.0386f*A[t%2][i+3][j+2][k] -
              0.0396f*A[t%2][i+3][j+2][k+1] -
              0.0406f*A[t%2][i+3][j+2][k+2] -
              0.0416f*A[t%2][i+3][j+2][k+3] -
              0.0426f*A[t%2][i+3][j+3][k-3] -
              0.0436f*A[t%2][i+3][j+3][k-2] -
              0.0446f*A[t%2][i+3][j+3][k-1] -
              0.0456f*A[t%2][i+3][j+3][k] -
              0.0466f*A[t%2][i+3][j+3][k+1] -
              0.0476f*A[t%2][i+3][j+3][k+2] -
              0.0486f*A[t%2][i+3][j+3][k+3];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
