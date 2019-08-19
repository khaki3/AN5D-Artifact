#include "star2d3r-512-4-128_kernel.hu"
__device__ double __sbref_wrap(double *sb, size_t index) { return sb[index]; }

__global__ void kernel0_4(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __halo1 = 3;
    const AN5D_TYPE __halo2 = 3;
    const AN5D_TYPE __side0Len = 4;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 488;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num;
    const AN5D_TYPE __c2 = (blockIdx.x % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_0_3;
    double __reg_0_4;
    double __reg_0_5;
    double __reg_0_6;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_1_3;
    double __reg_1_4;
    double __reg_1_5;
    double __reg_1_6;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_2_3;
    double __reg_2_4;
    double __reg_2_5;
    double __reg_2_6;
    double __reg_3_0;
    double __reg_3_1;
    double __reg_3_2;
    double __reg_3_3;
    double __reg_3_4;
    double __reg_3_5;
    double __reg_3_6;
    __shared__ double __d_sb_double[__blockSize * 2];
    double *__d_sb = __d_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __storeValid = __writeValid4;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR(__rn0, __a, __b, __c, __d, __e, __f, __g) do { __rn0 = (((((((((((((0.06251f * (__REGREF(__a, 0))) + (0.06255f * (__REGREF(__b, 0)))) + (0.06245f * (__REGREF(__c, 0)))) + (0.06252f * (__SBREF(__d_sb, -3)))) + (0.06249f * (__SBREF(__d_sb, -2)))) + (0.06244f * (__SBREF(__d_sb, -1)))) + (0.25002f * (__REGREF(__d, 0)))) + (0.06248f * (__SBREF(__d_sb, 1)))) + (0.06243f * (__SBREF(__d_sb, 2)))) + (0.06253f * (__SBREF(__d_sb, 3)))) + (0.06246f * (__REGREF(__e, 0)))) + (0.06242f * (__REGREF(__f, 0)))) + (0.06254f * (__REGREF(__g, 0)))); } while (0)
    #define __DB_SWITCH() do { __d_sb = &__d_sb_double[(__d_sb == __d_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c, d, e, f, g) do { __DB_SWITCH(); __d_sb[__tid] = d; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __CALC2(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __CALC3(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid3) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __STORE(h, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2, reg3, reg4, reg5, reg6); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_3_0, 0);
      __LOAD(__reg_3_1, 1);
      __LOAD(__reg_3_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_3_0, __reg_3_1, __reg_3_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_3_1, __reg_3_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_3_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_3_0, __reg_3_1, __reg_3_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_3_1, __reg_3_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_3_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_3, __reg_3_0, __reg_3_1, __reg_3_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __LOAD(__reg_0_6, 13);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __CALC3(__reg_3_4, __reg_3_1, __reg_3_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __LOAD(__reg_0_0, 14);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __CALC3(__reg_3_5, __reg_3_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 15);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __STORE(3, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
      __LOAD(__reg_0_2, 16);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __STORE(4, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
      __LOAD(__reg_0_3, 17);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __STORE(5, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
      __LOAD(__reg_0_4, 18);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
      __STORE(6, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_5, 19);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __STORE(7, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
      __LOAD(__reg_0_6, 20);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __STORE(8, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
      __LOAD(__reg_0_0, 21);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __STORE(9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
      __LOAD(__reg_0_1, 22);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __STORE(10, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
      __LOAD(__reg_0_2, 23);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __STORE(11, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
      __LOAD(__reg_0_3, 24);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __STORE(12, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_6, 13);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __LOAD(__reg_0_0, 14);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __LOAD(__reg_0_1, 15);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __LOAD(__reg_0_2, 16);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __LOAD(__reg_0_3, 17);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __LOAD(__reg_0_4, 18);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
      __LOAD(__reg_0_5, 19);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __LOAD(__reg_0_6, 20);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __LOAD(__reg_0_0, 21);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 22);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 23);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __LOAD(__reg_0_3, 24);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __STORE(12, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
    }
    __d_sb = __d_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 25; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __h++;
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 12, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __h++;
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 12, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 12, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 12, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 12, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 12, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __h++;
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_0_1);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_0_1, __reg_0_2, __reg_0_3);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_0_2);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_0_2, __reg_0_3, __reg_0_4);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __LOAD(__reg_0_5, __h + 1);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_0_3);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 2, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_0_3, __reg_0_4, __reg_0_5);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __LOAD(__reg_0_5, __h + 1);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __LOAD(__reg_0_6, __h + 2);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_0_4);
        __STORE(__h - 2, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 1, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_0_4, __reg_0_5, __reg_0_6);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __LOAD(__reg_0_5, __h + 1);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __LOAD(__reg_0_6, __h + 2);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __LOAD(__reg_0_0, __h + 3);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __STORE(__h - 2, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_0_5);
        __STORE(__h - 1, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_0_5, __reg_0_6);
        __STORE(__h + 0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_0_5, __reg_0_6, __reg_0_0);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __LOAD(__reg_0_5, __h + 1);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __LOAD(__reg_0_6, __h + 2);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __LOAD(__reg_0_0, __h + 3);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __LOAD(__reg_0_1, __h + 4);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 2, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __STORE(__h - 1, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_0_6);
        __STORE(__h + 0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_0_6, __reg_0_0);
        __STORE(__h + 1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_0_6, __reg_0_0, __reg_0_1);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_4, __h + 0);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __LOAD(__reg_0_5, __h + 1);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 11, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __LOAD(__reg_0_6, __h + 2);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 10, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __LOAD(__reg_0_0, __h + 3);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 9, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __LOAD(__reg_0_1, __h + 4);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 8, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __LOAD(__reg_0_2, __h + 5);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 7, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 6, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 5, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 4, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0);
        __STORE(__h - 3, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 2, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 1, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __STORE(__h + 0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_0_0);
        __STORE(__h + 1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_0_0, __reg_0_1);
        __STORE(__h + 2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_0_0, __reg_0_1, __reg_0_2);
      }
    }
    else
    {
      for (__h = 25; __h <= __side1LenOl - 7;)
      {
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
        __h++;
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 12, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
        __h++;
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h - 12, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 12, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 12, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 12, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 12, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_4, __h);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
      __STORE(__h - 12, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_5, __h);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __STORE(__h - 12, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_6, __h);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __CALC3(__reg_3_4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __STORE(__h - 12, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __CALC3(__reg_3_5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __STORE(__h - 12, __reg_3_6, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __CALC3(__reg_3_6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __STORE(__h - 12, __reg_3_0, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __CALC3(__reg_3_0, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __STORE(__h - 12, __reg_3_1, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_3, __h);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __STORE(__h - 12, __reg_3_2, __reg_3_3, __reg_3_4, __reg_3_5, __reg_3_6, __reg_3_0, __reg_3_1);
      __h++;
    }
}
__global__ void kernel0_3(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __halo1 = 3;
    const AN5D_TYPE __halo2 = 3;
    const AN5D_TYPE __side0Len = 3;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 494;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num;
    const AN5D_TYPE __c2 = (blockIdx.x % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_0_3;
    double __reg_0_4;
    double __reg_0_5;
    double __reg_0_6;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_1_3;
    double __reg_1_4;
    double __reg_1_5;
    double __reg_1_6;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_2_3;
    double __reg_2_4;
    double __reg_2_5;
    double __reg_2_6;
    __shared__ double __d_sb_double[__blockSize * 2];
    double *__d_sb = __d_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __storeValid = __writeValid3;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR(__rn0, __a, __b, __c, __d, __e, __f, __g) do { __rn0 = (((((((((((((0.06251f * (__REGREF(__a, 0))) + (0.06255f * (__REGREF(__b, 0)))) + (0.06245f * (__REGREF(__c, 0)))) + (0.06252f * (__SBREF(__d_sb, -3)))) + (0.06249f * (__SBREF(__d_sb, -2)))) + (0.06244f * (__SBREF(__d_sb, -1)))) + (0.25002f * (__REGREF(__d, 0)))) + (0.06248f * (__SBREF(__d_sb, 1)))) + (0.06243f * (__SBREF(__d_sb, 2)))) + (0.06253f * (__SBREF(__d_sb, 3)))) + (0.06246f * (__REGREF(__e, 0)))) + (0.06242f * (__REGREF(__f, 0)))) + (0.06254f * (__REGREF(__g, 0)))); } while (0)
    #define __DB_SWITCH() do { __d_sb = &__d_sb_double[(__d_sb == __d_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c, d, e, f, g) do { __DB_SWITCH(); __d_sb[__tid] = d; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __CALC2(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __STORE(h, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2, reg3, reg4, reg5, reg6); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_2_0, 0);
      __LOAD(__reg_2_1, 1);
      __LOAD(__reg_2_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_2_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_2_1, __reg_2_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_2_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __STORE(3, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __LOAD(__reg_0_6, 13);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __STORE(4, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __LOAD(__reg_0_0, 14);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __STORE(5, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 15);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __STORE(6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 16);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __STORE(7, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __LOAD(__reg_0_3, 17);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __STORE(8, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __LOAD(__reg_0_4, 18);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __STORE(9, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_6, 13);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __LOAD(__reg_0_0, 14);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __LOAD(__reg_0_1, 15);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __LOAD(__reg_0_2, 16);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __LOAD(__reg_0_3, 17);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __LOAD(__reg_0_4, 18);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __STORE(9, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
      __DB_SWITCH(); __syncthreads();
    }
    __d_sb = __d_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 19; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __h++;
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 9, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 9, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 9, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __STORE(__h - 9, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __STORE(__h - 9, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __h++;
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __STORE(__h - 9, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_0_2, __reg_0_3, __reg_0_4);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_0_3, __reg_0_4, __reg_0_5);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __LOAD(__reg_0_6, __h + 1);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 2, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_0_4, __reg_0_5, __reg_0_6);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __LOAD(__reg_0_6, __h + 1);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __LOAD(__reg_0_0, __h + 2);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5);
        __STORE(__h - 2, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 1, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_0_5, __reg_0_6, __reg_0_0);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __LOAD(__reg_0_6, __h + 1);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __LOAD(__reg_0_0, __h + 2);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __LOAD(__reg_0_1, __h + 3);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __STORE(__h - 2, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6);
        __STORE(__h - 1, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6, __reg_0_0);
        __STORE(__h + 0, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_0_6, __reg_0_0, __reg_0_1);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __LOAD(__reg_0_6, __h + 1);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __LOAD(__reg_0_0, __h + 2);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __LOAD(__reg_0_1, __h + 3);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __LOAD(__reg_0_2, __h + 4);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __STORE(__h - 1, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0);
        __STORE(__h + 0, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0, __reg_0_1);
        __STORE(__h + 1, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_0_0, __reg_0_1, __reg_0_2);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_5, __h + 0);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __LOAD(__reg_0_6, __h + 1);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 8, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __LOAD(__reg_0_0, __h + 2);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 7, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __LOAD(__reg_0_1, __h + 3);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 6, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __LOAD(__reg_0_2, __h + 4);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __STORE(__h - 5, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __LOAD(__reg_0_3, __h + 5);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __STORE(__h - 4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1);
        __STORE(__h - 3, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 1, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __STORE(__h + 0, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1);
        __STORE(__h + 1, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1, __reg_0_2);
        __STORE(__h + 2, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_0_1, __reg_0_2, __reg_0_3);
      }
    }
    else
    {
      for (__h = 19; __h <= __side1LenOl - 7;)
      {
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
        __h++;
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 9, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 9, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 9, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __STORE(__h - 9, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __STORE(__h - 9, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
        __h++;
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __STORE(__h - 9, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_5, __h);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __CALC2(__reg_2_6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __STORE(__h - 9, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_6, __h);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __CALC2(__reg_2_0, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __STORE(__h - 9, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __STORE(__h - 9, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __STORE(__h - 9, __reg_2_3, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __STORE(__h - 9, __reg_2_4, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_3, __h);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __CALC2(__reg_2_4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __STORE(__h - 9, __reg_2_5, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_4, __h);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __CALC2(__reg_2_5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __STORE(__h - 9, __reg_2_6, __reg_2_0, __reg_2_1, __reg_2_2, __reg_2_3, __reg_2_4, __reg_2_5);
      __h++;
    }
}
__global__ void kernel0_2(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __halo1 = 3;
    const AN5D_TYPE __halo2 = 3;
    const AN5D_TYPE __side0Len = 2;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 500;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num;
    const AN5D_TYPE __c2 = (blockIdx.x % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_0_3;
    double __reg_0_4;
    double __reg_0_5;
    double __reg_0_6;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_1_3;
    double __reg_1_4;
    double __reg_1_5;
    double __reg_1_6;
    __shared__ double __d_sb_double[__blockSize * 2];
    double *__d_sb = __d_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __storeValid = __writeValid2;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR(__rn0, __a, __b, __c, __d, __e, __f, __g) do { __rn0 = (((((((((((((0.06251f * (__REGREF(__a, 0))) + (0.06255f * (__REGREF(__b, 0)))) + (0.06245f * (__REGREF(__c, 0)))) + (0.06252f * (__SBREF(__d_sb, -3)))) + (0.06249f * (__SBREF(__d_sb, -2)))) + (0.06244f * (__SBREF(__d_sb, -1)))) + (0.25002f * (__REGREF(__d, 0)))) + (0.06248f * (__SBREF(__d_sb, 1)))) + (0.06243f * (__SBREF(__d_sb, 2)))) + (0.06253f * (__SBREF(__d_sb, 3)))) + (0.06246f * (__REGREF(__e, 0)))) + (0.06242f * (__REGREF(__f, 0)))) + (0.06254f * (__REGREF(__g, 0)))); } while (0)
    #define __DB_SWITCH() do { __d_sb = &__d_sb_double[(__d_sb == __d_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c, d, e, f, g) do { __DB_SWITCH(); __d_sb[__tid] = d; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2, reg3, reg4, reg5, reg6); else out = reg3; } while (0)
    #define __STORE(h, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2, reg3, reg4, reg5, reg6); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_1_0, 0);
      __LOAD(__reg_1_1, 1);
      __LOAD(__reg_1_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __STORE(3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __STORE(4, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __STORE(5, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __STORE(6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __LOAD(__reg_0_0, 7);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __LOAD(__reg_0_1, 8);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __LOAD(__reg_0_2, 9);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_3, 10);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __LOAD(__reg_0_4, 11);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __LOAD(__reg_0_5, 12);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __STORE(6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __DB_SWITCH(); __syncthreads();
    }
    __d_sb = __d_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 13; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 6, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 6, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 6, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __h++;
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 6, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __h++;
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __h++;
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_0_3, __reg_0_4, __reg_0_5);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_0_4, __reg_0_5, __reg_0_6);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_0_5, __reg_0_6, __reg_0_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __LOAD(__reg_0_1, __h + 2);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_0_6, __reg_0_0, __reg_0_1);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __LOAD(__reg_0_1, __h + 2);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __LOAD(__reg_0_2, __h + 3);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0);
        __STORE(__h - 1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1);
        __STORE(__h + 0, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_0_0, __reg_0_1, __reg_0_2);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __LOAD(__reg_0_1, __h + 2);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __LOAD(__reg_0_2, __h + 3);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __LOAD(__reg_0_3, __h + 4);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __STORE(__h - 1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1);
        __STORE(__h + 0, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2);
        __STORE(__h + 1, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_0_1, __reg_0_2, __reg_0_3);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_6, __h + 0);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 5, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __LOAD(__reg_0_1, __h + 2);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 4, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __LOAD(__reg_0_2, __h + 3);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 3, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __LOAD(__reg_0_3, __h + 4);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __LOAD(__reg_0_4, __h + 5);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __STORE(__h + 0, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2);
        __STORE(__h + 1, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3);
        __STORE(__h + 2, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_0_2, __reg_0_3, __reg_0_4);
      }
    }
    else
    {
      for (__h = 13; __h <= __side1LenOl - 7;)
      {
        __LOAD(__reg_0_6, __h);
        __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __STORE(__h - 6, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __STORE(__h - 6, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
        __h++;
        __LOAD(__reg_0_3, __h);
        __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __STORE(__h - 6, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
        __h++;
        __LOAD(__reg_0_4, __h);
        __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __STORE(__h - 6, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
        __h++;
        __LOAD(__reg_0_5, __h);
        __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __STORE(__h - 6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_6, __h);
      __CALC1(__reg_1_3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __STORE(__h - 6, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_4, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __STORE(__h - 6, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_5, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __STORE(__h - 6, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_6, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __STORE(__h - 6, __reg_1_0, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_3, __h);
      __CALC1(__reg_1_0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __STORE(__h - 6, __reg_1_1, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_4, __h);
      __CALC1(__reg_1_1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __STORE(__h - 6, __reg_1_2, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_5, __h);
      __CALC1(__reg_1_2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __STORE(__h - 6, __reg_1_3, __reg_1_4, __reg_1_5, __reg_1_6, __reg_1_0, __reg_1_1, __reg_1_2);
      __h++;
    }
}
__global__ void kernel0_1(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __halo1 = 3;
    const AN5D_TYPE __halo2 = 3;
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 506;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num;
    const AN5D_TYPE __c2 = (blockIdx.x % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_0_3;
    double __reg_0_4;
    double __reg_0_5;
    double __reg_0_6;
    __shared__ double __d_sb_double[__blockSize * 2];
    double *__d_sb = __d_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __storeValid = __writeValid1;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR(__rn0, __a, __b, __c, __d, __e, __f, __g) do { __rn0 = (((((((((((((0.06251f * (__REGREF(__a, 0))) + (0.06255f * (__REGREF(__b, 0)))) + (0.06245f * (__REGREF(__c, 0)))) + (0.06252f * (__SBREF(__d_sb, -3)))) + (0.06249f * (__SBREF(__d_sb, -2)))) + (0.06244f * (__SBREF(__d_sb, -1)))) + (0.25002f * (__REGREF(__d, 0)))) + (0.06248f * (__SBREF(__d_sb, 1)))) + (0.06243f * (__SBREF(__d_sb, 2)))) + (0.06253f * (__SBREF(__d_sb, 3)))) + (0.06246f * (__REGREF(__e, 0)))) + (0.06242f * (__REGREF(__f, 0)))) + (0.06254f * (__REGREF(__g, 0)))); } while (0)
    #define __DB_SWITCH() do { __d_sb = &__d_sb_double[(__d_sb == __d_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c, d, e, f, g) do { __DB_SWITCH(); __d_sb[__tid] = d; __syncthreads(); } while (0)
    #define __STORE(h, reg0, reg1, reg2, reg3, reg4, reg5, reg6) do { __CALCSETUP(reg0, reg1, reg2, reg3, reg4, reg5, reg6); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2, reg3, reg4, reg5, reg6); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __STORE(3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __LOAD(__reg_0_3, 3);
      __LOAD(__reg_0_4, 4);
      __LOAD(__reg_0_5, 5);
      __LOAD(__reg_0_6, 6);
      __STORE(3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
    }
    __d_sb = __d_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 7; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0_0, __h);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __STORE(__h - 3, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __STORE(__h - 3, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __h++;
        __LOAD(__reg_0_3, __h);
        __STORE(__h - 3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __h++;
        __LOAD(__reg_0_4, __h);
        __STORE(__h - 3, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __h++;
        __LOAD(__reg_0_5, __h);
        __STORE(__h - 3, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __h++;
        __LOAD(__reg_0_6, __h);
        __STORE(__h - 3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h - 2, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h - 2, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __LOAD(__reg_0_2, __h + 2);
        __STORE(__h - 1, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h - 2, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __LOAD(__reg_0_2, __h + 2);
        __STORE(__h - 1, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __LOAD(__reg_0_3, __h + 3);
        __STORE(__h + 0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h - 2, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __LOAD(__reg_0_2, __h + 2);
        __STORE(__h - 1, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __LOAD(__reg_0_3, __h + 3);
        __STORE(__h + 0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __LOAD(__reg_0_4, __h + 4);
        __STORE(__h + 1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h - 2, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __LOAD(__reg_0_2, __h + 2);
        __STORE(__h - 1, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __LOAD(__reg_0_3, __h + 3);
        __STORE(__h + 0, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __LOAD(__reg_0_4, __h + 4);
        __STORE(__h + 1, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __LOAD(__reg_0_5, __h + 5);
        __STORE(__h + 2, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      }
    }
    else
    {
      for (__h = 7; __h <= __side1LenOl - 7;)
      {
        __LOAD(__reg_0_0, __h);
        __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __STORE(__h - 3, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __STORE(__h - 3, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
        __h++;
        __LOAD(__reg_0_3, __h);
        __STORE(__h - 3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
        __h++;
        __LOAD(__reg_0_4, __h);
        __STORE(__h - 3, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
        __h++;
        __LOAD(__reg_0_5, __h);
        __STORE(__h - 3, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
        __h++;
        __LOAD(__reg_0_6, __h);
        __STORE(__h - 3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __STORE(__h - 3, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __STORE(__h - 3, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __STORE(__h - 3, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_3, __h);
      __STORE(__h - 3, __reg_0_4, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_4, __h);
      __STORE(__h - 3, __reg_0_5, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_5, __h);
      __STORE(__h - 3, __reg_0_6, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_6, __h);
      __STORE(__h - 3, __reg_0_0, __reg_0_1, __reg_0_2, __reg_0_3, __reg_0_4, __reg_0_5, __reg_0_6);
      __h++;
    }
}
