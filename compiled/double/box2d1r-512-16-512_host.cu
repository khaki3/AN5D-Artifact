#include <assert.h>
#include <stdio.h>
#include "box2d1r-512-16-512_kernel.hu"
#define BENCH_DIM 2
#define BENCH_FPP 17
#define BENCH_RAD 1

#include "common.h"

double kernel_stencil(SB_TYPE *A1, int compsize, int timestep, bool scop)
{
  double start_time = sb_time(), end_time = 0.0;
  int dimsize = compsize + BENCH_RAD * 2;
  SB_TYPE (*A)[dimsize][dimsize] = (SB_TYPE (*)[dimsize][dimsize])A1;

  if (scop) {
    if (dimsize >= 3 && timestep >= 1) {
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
      
      cudaCheckReturn(cudaMalloc((void **) &dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double)));
      
{
      cudaCheckReturn(cudaMemcpy(dev_A, A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double), cudaMemcpyHostToDevice));
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
      const AN5D_TYPE __c1Len = (dimsize - 1 - 1);
      const AN5D_TYPE __c1Pad = (1);
      #define __c1 c1
      const AN5D_TYPE __c2Len = (dimsize - 1 - 1);
      const AN5D_TYPE __c2Pad = (1);
      #define __c2 c2
      const AN5D_TYPE __halo1 = 1;
      const AN5D_TYPE __halo2 = 1;
      AN5D_TYPE c0;
      AN5D_TYPE __side0LenMax;
      {
        const AN5D_TYPE __side0Len = 16;
        const AN5D_TYPE __side1Len = 512;
        const AN5D_TYPE __side2Len = 480;
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
          kernel0_16<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
      }
      if ((__c0Len % 2) != (((__c0Len + __side0LenMax - 1) / __side0LenMax) % 2))
      {
        if (__c0Len % __side0LenMax == 0)
        {
          {
            const AN5D_TYPE __side0Len = 8;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 496;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_8<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 8;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 496;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_8<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 1)
        {
          {
            const AN5D_TYPE __side0Len = 7;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 498;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 2)
        {
          {
            const AN5D_TYPE __side0Len = 1;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 510;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 510;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 508;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 510;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 508;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 508;
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
        else if (__c0Len % __side0LenMax == 5)
        {
          {
            const AN5D_TYPE __side0Len = 3;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 506;
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
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 508;
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
        else if (__c0Len % __side0LenMax == 6)
        {
          {
            const AN5D_TYPE __side0Len = 3;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 506;
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
            const AN5D_TYPE __side0Len = 3;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 506;
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
        }
        else if (__c0Len % __side0LenMax == 7)
        {
          {
            const AN5D_TYPE __side0Len = 4;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 504;
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
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 3;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 506;
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
        }
        else if (__c0Len % __side0LenMax == 8)
        {
          {
            const AN5D_TYPE __side0Len = 4;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 504;
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
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 4;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 504;
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
        else if (__c0Len % __side0LenMax == 9)
        {
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 4;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 504;
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
        else if (__c0Len % __side0LenMax == 10)
        {
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 11)
        {
          {
            const AN5D_TYPE __side0Len = 6;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 500;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_6<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 5;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 502;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 12)
        {
          {
            const AN5D_TYPE __side0Len = 6;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 500;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_6<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 6;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 500;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_6<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 13)
        {
          {
            const AN5D_TYPE __side0Len = 7;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 498;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 6;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 500;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_6<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 14)
        {
          {
            const AN5D_TYPE __side0Len = 7;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 498;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 7;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 498;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
        else if (__c0Len % __side0LenMax == 15)
        {
          {
            const AN5D_TYPE __side0Len = 8;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 496;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_8<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
          c0 += 1;
          {
            const AN5D_TYPE __side0Len = 7;
            const AN5D_TYPE __side1Len = 512;
            const AN5D_TYPE __side2Len = 498;
            const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
            const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
            const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
            const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
            const AN5D_TYPE __blockSize = 1 * __side2LenOl;
            assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
            dim3 k0_dimBlock(__blockSize, 1, 1);
            dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
            kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
          }
        }
      }
      else if (__c0Len % __side0LenMax)
      {
        if (__c0Len % __side0LenMax == 1)
        {
          const AN5D_TYPE __side0Len = 1;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 510;
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
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 508;
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
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 506;
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
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 504;
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
        else if (__c0Len % __side0LenMax == 5)
        {
          const AN5D_TYPE __side0Len = 5;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 502;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_5<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 6)
        {
          const AN5D_TYPE __side0Len = 6;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 500;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_6<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 7)
        {
          const AN5D_TYPE __side0Len = 7;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 498;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_7<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 8)
        {
          const AN5D_TYPE __side0Len = 8;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 496;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_8<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 9)
        {
          const AN5D_TYPE __side0Len = 9;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 494;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_9<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 10)
        {
          const AN5D_TYPE __side0Len = 10;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 492;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_10<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 11)
        {
          const AN5D_TYPE __side0Len = 11;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 490;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_11<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 12)
        {
          const AN5D_TYPE __side0Len = 12;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 488;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_12<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 13)
        {
          const AN5D_TYPE __side0Len = 13;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 486;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_13<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 14)
        {
          const AN5D_TYPE __side0Len = 14;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 484;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_14<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
        else if (__c0Len % __side0LenMax == 15)
        {
          const AN5D_TYPE __side0Len = 15;
          const AN5D_TYPE __side1Len = 512;
          const AN5D_TYPE __side2Len = 482;
          const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
          const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
          const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
          const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
          const AN5D_TYPE __blockSize = 1 * __side2LenOl;
          assert((__side1Len >= 2 * __side0Len * __halo1) && (__c1Len % __side1Len == 0 || __c1Len % __side1Len >= 2 * __side0Len * __halo1) && "[AN5D ERROR] Too short stream");
          dim3 k0_dimBlock(__blockSize, 1, 1);
          dim3 k0_dimGrid(1 * ((__c1Len + __side1Len - 1) / __side1Len) * ((__c2Len + __side2Len - 1) / __side2Len), 1, 1);
          kernel0_15<<<k0_dimGrid, k0_dimBlock>>> (dev_A, dimsize, timestep, c0);
        }
      }
    }
    cudaCheckKernel();
{
#ifdef STENCILBENCH
cudaDeviceSynchronize();
SB_STOP_INSTRUMENTS;
#endif
      cudaCheckReturn(cudaMemcpy(A, dev_A, (size_t)(2) * (size_t)(dimsize) * (size_t)(dimsize) * sizeof(double), cudaMemcpyDeviceToHost));
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
            0.09371f * A[t%2][i-1][j-1] + 0.09374f * A[t%2][i-1][j] + 0.09376f * A[t%2][i-1][j+1] +
            0.09372f * A[t%2][i][j-1]   + 0.25001f * A[t%2][i][j]   + 0.09377f * A[t%2][i][j+1] +
            0.09373f * A[t%2][i+1][j-1] + 0.09375f * A[t%2][i+1][j] + 0.09378f * A[t%2][i+1][j+1];
  }

  return (((end_time != 0.0) ? end_time : sb_time()) - start_time);
}
