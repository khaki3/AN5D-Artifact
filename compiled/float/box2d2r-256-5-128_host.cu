#include <assert.h>
#include <stdio.h>
#include "box2d2r-256-5-128_kernel.hu"
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

      float *dev_A;
      
      cudaCheckReturn(cudaMalloc((void **) &dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float)));
      
{
      cudaCheckReturn(cudaMemcpy(dev_A, A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float), cudaMemcpyHostToDevice));
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
      const AN5D_TYPE __halo1 = 2;
      const AN5D_TYPE __halo2 = 2;
      AN5D_TYPE c0;
      AN5D_TYPE __side0LenMax;
      {
        const AN5D_TYPE __side0Len = 5;
        const AN5D_TYPE __side1Len = 128;
        const AN5D_TYPE __side2Len = 236;
        const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
        const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
        const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
        const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
        const AN5D_TYPE __blockSize = 1 * __side2LenOl;
        assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
        dim3 k0_dimBlock(__blockSize, 1, 1);
        dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
        AN5D_TYPE __c0Padr = (__c0Len % 2) != (((__c0Len + __side0Len - 1) / __side0Len) % 2) && __c0Len % __side0Len < 2 ? 1 : 0;
        __side0LenMax = __side0Len;
        for (c0 = __c0Pad; c0 < __c0Pad + __c0Len / __side0Len - __c0Padr; c0 += 1)
        {
          kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
      }
      if ((__c0Len % 2) != (((__c0Len + __side0LenMax - 1) / __side0LenMax) % 2))
      {
        if (__c0Len % __side0LenMax == 0)
        {
          {
            const AN5D_TYPE __side0Len = 3;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 244;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_3<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 1)
        {
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 2)
        {
          {
            const AN5D_TYPE __side0Len = 1;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 252;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_1<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 1;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 252;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_1<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 3)
        {
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 1;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 252;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_1<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 4)
        {
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 2;
            const AN5D_TYPE __side1Len = 128;
            const AN5D_TYPE __side2Len = 248;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
      }
      else if (__c0Len % __side0LenMax)
      {
        if (__c0Len % __side0LenMax == 1)
        {
          const AN5D_TYPE __side0Len = 1;
          const AN5D_TYPE __side1Len = 128;
          const AN5D_TYPE __side2Len = 252;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_1<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 2)
        {
          const AN5D_TYPE __side0Len = 2;
          const AN5D_TYPE __side1Len = 128;
          const AN5D_TYPE __side2Len = 248;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_2<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 3)
        {
          const AN5D_TYPE __side0Len = 3;
          const AN5D_TYPE __side1Len = 128;
          const AN5D_TYPE __side2Len = 244;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_3<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 4)
        {
          const AN5D_TYPE __side0Len = 4;
          const AN5D_TYPE __side1Len = 128;
          const AN5D_TYPE __side2Len = 240;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_4<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
      }
    }
    cudaCheckKernel();
{
#ifdef STENCILBENCH
cudaDeviceSynchronize();
SB_STOP_INSTRUMENTS;
#endif
      cudaCheckReturn(cudaMemcpy(A, dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(float), cudaMemcpyDeviceToHost));
}
      cudaCheckReturn(cudaFree(dev_A));
    }
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
