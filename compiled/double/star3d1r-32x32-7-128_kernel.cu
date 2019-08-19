#include "star3d1r-32x32-7-128_kernel.hu"
__device__ double __sbref_wrap(double *sb, size_t index) { return sb[index]; }

__global__ void kernel0_7(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 7;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 18;
    const AN5D_TYPE __side3Len = 18;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_3_0;
    double __reg_3_1;
    double __reg_3_2;
    double __reg_4_0;
    double __reg_4_1;
    double __reg_4_2;
    double __reg_5_0;
    double __reg_5_1;
    double __reg_5_2;
    double __reg_6_0;
    double __reg_6_1;
    double __reg_6_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3) && __local_c3 >= (__halo3 * 3) && __local_c3 < __side3LenOl - (__halo3 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4) && __local_c3 >= (__halo3 * 4) && __local_c3 < __side3LenOl - (__halo3 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5) && __local_c3 >= (__halo3 * 5) && __local_c3 < __side3LenOl - (__halo3 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6) && __local_c3 >= (__halo3 * 6) && __local_c3 < __side3LenOl - (__halo3 * 6);
    const AN5D_TYPE __writeValid7 = __updateValid && __local_c2 >= (__halo2 * 7) && __local_c2 < __side2LenOl - (__halo2 * 7) && __local_c3 >= (__halo3 * 7) && __local_c3 < __side3LenOl - (__halo3 * 7);
    const AN5D_TYPE __storeValid = __writeValid7;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC2(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC3(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid3) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC4(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid4) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC5(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid5) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC6(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid6) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_6_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_6_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_6_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_6_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_6_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_6_0, __reg_4_1, __reg_4_2);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_5_1, __reg_5_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
      __STORE(1, __reg_6_0, __reg_6_1, __reg_6_2);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
      __STORE(2, __reg_6_1, __reg_6_2, __reg_6_0);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
      __STORE(3, __reg_6_2, __reg_6_0, __reg_6_1);
      __LOAD(__reg_0_2, 11);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
      __STORE(4, __reg_6_0, __reg_6_1, __reg_6_2);
      __LOAD(__reg_0_0, 12);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
      __STORE(5, __reg_6_1, __reg_6_2, __reg_6_0);
      __LOAD(__reg_0_1, 13);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
      __STORE(6, __reg_6_2, __reg_6_0, __reg_6_1);
      __LOAD(__reg_0_2, 14);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
      __STORE(7, __reg_6_0, __reg_6_1, __reg_6_2);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __LOAD(__reg_0_2, 11);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __LOAD(__reg_0_0, 12);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
      __LOAD(__reg_0_1, 13);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
      __LOAD(__reg_0_2, 14);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
      __STORE(7, __reg_6_0, __reg_6_1, __reg_6_2);
      __DB_SWITCH(); __syncthreads();
    }
    __b_sb = __b_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 15; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 7, __reg_6_2, __reg_6_0, __reg_6_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 7, __reg_6_0, __reg_6_1, __reg_6_2);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_0_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_0_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_2, __reg_6_0, __reg_6_1);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_0_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_0, __reg_6_1, __reg_6_2);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_0_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_1, __reg_6_2, __reg_6_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_0_2);
        __STORE(__h - 3, __reg_6_2, __reg_6_0, __reg_6_1);
        __STORE(__h - 2, __reg_6_0, __reg_6_1, __reg_0_2);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_2, __reg_6_0, __reg_6_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_0_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_0, __reg_6_1, __reg_6_2);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_0_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_1, __reg_6_2, __reg_6_0);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_0_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 3, __reg_6_2, __reg_6_0, __reg_6_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_0_0);
        __STORE(__h - 2, __reg_6_0, __reg_6_1, __reg_6_2);
        __STORE(__h - 1, __reg_6_1, __reg_6_2, __reg_0_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
        __LOAD(__reg_0_1, __h + 1);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_2, __reg_6_0, __reg_6_1);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_0, __reg_6_1, __reg_6_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_0_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_1, __reg_6_2, __reg_6_0);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_0_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 3, __reg_6_2, __reg_6_0, __reg_6_1);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_0_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 2, __reg_6_0, __reg_6_1, __reg_6_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_0_1);
        __STORE(__h - 1, __reg_6_1, __reg_6_2, __reg_6_0);
        __STORE(__h + 0, __reg_6_2, __reg_6_0, __reg_0_1);
      }
    }
    else
    {
      for (__h = 15; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 7, __reg_6_2, __reg_6_0, __reg_6_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 7, __reg_6_0, __reg_6_1, __reg_6_2);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __CALC6(__reg_6_0, __reg_5_2, __reg_5_0, __reg_5_1);
      __STORE(__h - 7, __reg_6_1, __reg_6_2, __reg_6_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __CALC6(__reg_6_1, __reg_5_0, __reg_5_1, __reg_5_2);
      __STORE(__h - 7, __reg_6_2, __reg_6_0, __reg_6_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __CALC6(__reg_6_2, __reg_5_1, __reg_5_2, __reg_5_0);
      __STORE(__h - 7, __reg_6_0, __reg_6_1, __reg_6_2);
      __h++;
    }
}
__global__ void kernel0_6(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 6;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 20;
    const AN5D_TYPE __side3Len = 20;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_3_0;
    double __reg_3_1;
    double __reg_3_2;
    double __reg_4_0;
    double __reg_4_1;
    double __reg_4_2;
    double __reg_5_0;
    double __reg_5_1;
    double __reg_5_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3) && __local_c3 >= (__halo3 * 3) && __local_c3 < __side3LenOl - (__halo3 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4) && __local_c3 >= (__halo3 * 4) && __local_c3 < __side3LenOl - (__halo3 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5) && __local_c3 >= (__halo3 * 5) && __local_c3 < __side3LenOl - (__halo3 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6) && __local_c3 >= (__halo3 * 6) && __local_c3 < __side3LenOl - (__halo3 * 6);
    const AN5D_TYPE __storeValid = __writeValid6;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC2(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC3(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid3) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC4(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid4) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC5(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid5) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_5_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_5_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_5_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_5_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_5_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_4_1, __reg_4_2);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __STORE(1, __reg_5_0, __reg_5_1, __reg_5_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __STORE(2, __reg_5_1, __reg_5_2, __reg_5_0);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __STORE(3, __reg_5_2, __reg_5_0, __reg_5_1);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __STORE(4, __reg_5_0, __reg_5_1, __reg_5_2);
      __LOAD(__reg_0_2, 11);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __STORE(5, __reg_5_1, __reg_5_2, __reg_5_0);
      __LOAD(__reg_0_0, 12);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __STORE(6, __reg_5_2, __reg_5_0, __reg_5_1);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __LOAD(__reg_0_2, 11);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __LOAD(__reg_0_0, 12);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __STORE(6, __reg_5_2, __reg_5_0, __reg_5_1);
      __DB_SWITCH(); __syncthreads();
    }
    __b_sb = __b_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 13; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 6, __reg_5_1, __reg_5_2, __reg_5_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h - 6, __reg_5_2, __reg_5_0, __reg_5_1);
        __h++;
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_0_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_1, __reg_5_2, __reg_5_0);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_0_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_2, __reg_5_0, __reg_5_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_0_0);
        __STORE(__h - 3, __reg_5_0, __reg_5_1, __reg_5_2);
        __STORE(__h - 2, __reg_5_1, __reg_5_2, __reg_0_0);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_1, __h + 0);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_1, __reg_5_2, __reg_5_0);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_0_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_2, __reg_5_0, __reg_5_1);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_0_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 3, __reg_5_0, __reg_5_1, __reg_5_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_0_1);
        __STORE(__h - 2, __reg_5_1, __reg_5_2, __reg_5_0);
        __STORE(__h - 1, __reg_5_2, __reg_5_0, __reg_0_1);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_1, __h + 0);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
        __LOAD(__reg_0_2, __h + 1);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_1, __reg_5_2, __reg_5_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_0_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_2, __reg_5_0, __reg_5_1);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_0_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 3, __reg_5_0, __reg_5_1, __reg_5_2);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_0_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 2, __reg_5_1, __reg_5_2, __reg_5_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_0_2);
        __STORE(__h - 1, __reg_5_2, __reg_5_0, __reg_5_1);
        __STORE(__h + 0, __reg_5_0, __reg_5_1, __reg_0_2);
      }
    }
    else
    {
      for (__h = 13; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 6, __reg_5_1, __reg_5_2, __reg_5_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h - 6, __reg_5_2, __reg_5_0, __reg_5_1);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __CALC5(__reg_5_2, __reg_4_1, __reg_4_2, __reg_4_0);
      __STORE(__h - 6, __reg_5_0, __reg_5_1, __reg_5_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __CALC5(__reg_5_0, __reg_4_2, __reg_4_0, __reg_4_1);
      __STORE(__h - 6, __reg_5_1, __reg_5_2, __reg_5_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __CALC5(__reg_5_1, __reg_4_0, __reg_4_1, __reg_4_2);
      __STORE(__h - 6, __reg_5_2, __reg_5_0, __reg_5_1);
      __h++;
    }
}
__global__ void kernel0_5(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 5;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 22;
    const AN5D_TYPE __side3Len = 22;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_3_0;
    double __reg_3_1;
    double __reg_3_2;
    double __reg_4_0;
    double __reg_4_1;
    double __reg_4_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3) && __local_c3 >= (__halo3 * 3) && __local_c3 < __side3LenOl - (__halo3 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4) && __local_c3 >= (__halo3 * 4) && __local_c3 < __side3LenOl - (__halo3 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5) && __local_c3 >= (__halo3 * 5) && __local_c3 < __side3LenOl - (__halo3 * 5);
    const AN5D_TYPE __storeValid = __writeValid5;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC2(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC3(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid3) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC4(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid4) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_4_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_4_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_4_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_4_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __STORE(1, __reg_4_0, __reg_4_1, __reg_4_2);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __STORE(2, __reg_4_1, __reg_4_2, __reg_4_0);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __STORE(3, __reg_4_2, __reg_4_0, __reg_4_1);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __STORE(4, __reg_4_0, __reg_4_1, __reg_4_2);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __STORE(5, __reg_4_1, __reg_4_2, __reg_4_0);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 9);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __LOAD(__reg_0_1, 10);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __STORE(5, __reg_4_1, __reg_4_2, __reg_4_0);
    }
    __b_sb = __b_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 11; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h - 5, __reg_4_0, __reg_4_1, __reg_4_2);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __STORE(__h - 5, __reg_4_1, __reg_4_2, __reg_4_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_0_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_0_1);
        __STORE(__h - 3, __reg_4_1, __reg_4_2, __reg_4_0);
        __STORE(__h - 2, __reg_4_2, __reg_4_0, __reg_0_1);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_2, __h + 0);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_0_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_0_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __STORE(__h - 3, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_0_2);
        __STORE(__h - 2, __reg_4_2, __reg_4_0, __reg_4_1);
        __STORE(__h - 1, __reg_4_0, __reg_4_1, __reg_0_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_2, __h + 0);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_0, __reg_4_1, __reg_4_2);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __STORE(__h - 3, __reg_4_1, __reg_4_2, __reg_4_0);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_0_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 2, __reg_4_2, __reg_4_0, __reg_4_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_0_0);
        __STORE(__h - 1, __reg_4_0, __reg_4_1, __reg_4_2);
        __STORE(__h + 0, __reg_4_1, __reg_4_2, __reg_0_0);
      }
    }
    else
    {
      for (__h = 11; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h - 5, __reg_4_0, __reg_4_1, __reg_4_2);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
        __STORE(__h - 5, __reg_4_1, __reg_4_2, __reg_4_0);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __CALC4(__reg_4_1, __reg_3_0, __reg_3_1, __reg_3_2);
      __STORE(__h - 5, __reg_4_2, __reg_4_0, __reg_4_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __CALC4(__reg_4_2, __reg_3_1, __reg_3_2, __reg_3_0);
      __STORE(__h - 5, __reg_4_0, __reg_4_1, __reg_4_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __CALC4(__reg_4_0, __reg_3_2, __reg_3_0, __reg_3_1);
      __STORE(__h - 5, __reg_4_1, __reg_4_2, __reg_4_0);
      __h++;
    }
}
__global__ void kernel0_4(double *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 4;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 24;
    const AN5D_TYPE __side3Len = 24;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    double __reg_3_0;
    double __reg_3_1;
    double __reg_3_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3) && __local_c3 >= (__halo3 * 3) && __local_c3 < __side3LenOl - (__halo3 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4) && __local_c3 >= (__halo3 * 4) && __local_c3 < __side3LenOl - (__halo3 * 4);
    const AN5D_TYPE __storeValid = __writeValid4;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC2(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC3(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid3) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_3_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_3_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_3_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __STORE(1, __reg_3_0, __reg_3_1, __reg_3_2);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __STORE(2, __reg_3_1, __reg_3_2, __reg_3_0);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __STORE(3, __reg_3_2, __reg_3_0, __reg_3_1);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __STORE(4, __reg_3_0, __reg_3_1, __reg_3_2);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __LOAD(__reg_0_1, 7);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 8);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __STORE(4, __reg_3_0, __reg_3_1, __reg_3_2);
    }
    __b_sb = __b_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 9; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 4, __reg_3_2, __reg_3_0, __reg_3_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __STORE(__h - 4, __reg_3_0, __reg_3_1, __reg_3_2);
        __h++;
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_0_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_0_2);
        __STORE(__h - 3, __reg_3_2, __reg_3_0, __reg_3_1);
        __STORE(__h - 2, __reg_3_0, __reg_3_1, __reg_0_2);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_0_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_0_0);
        __STORE(__h - 2, __reg_3_0, __reg_3_1, __reg_3_2);
        __STORE(__h - 1, __reg_3_1, __reg_3_2, __reg_0_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
        __LOAD(__reg_0_1, __h + 1);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_2, __reg_3_0, __reg_3_1);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_0_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __STORE(__h - 2, __reg_3_0, __reg_3_1, __reg_3_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_0_1);
        __STORE(__h - 1, __reg_3_1, __reg_3_2, __reg_3_0);
        __STORE(__h + 0, __reg_3_2, __reg_3_0, __reg_0_1);
      }
    }
    else
    {
      for (__h = 9; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 4, __reg_3_2, __reg_3_0, __reg_3_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
        __STORE(__h - 4, __reg_3_0, __reg_3_1, __reg_3_2);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __CALC3(__reg_3_0, __reg_2_2, __reg_2_0, __reg_2_1);
      __STORE(__h - 4, __reg_3_1, __reg_3_2, __reg_3_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __CALC3(__reg_3_1, __reg_2_0, __reg_2_1, __reg_2_2);
      __STORE(__h - 4, __reg_3_2, __reg_3_0, __reg_3_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __CALC3(__reg_3_2, __reg_2_1, __reg_2_2, __reg_2_0);
      __STORE(__h - 4, __reg_3_0, __reg_3_1, __reg_3_2);
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
    const AN5D_TYPE __c1Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c1Pad = (1);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c2Pad = (1);
    #define __c2 c2
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 3;
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
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_2_0;
    double __reg_2_1;
    double __reg_2_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3) && __local_c3 >= (__halo3 * 3) && __local_c3 < __side3LenOl - (__halo3 * 3);
    const AN5D_TYPE __storeValid = __writeValid3;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __CALC2(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid2) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_2_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_2_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __STORE(1, __reg_2_0, __reg_2_1, __reg_2_2);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __STORE(2, __reg_2_1, __reg_2_2, __reg_2_0);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __STORE(3, __reg_2_2, __reg_2_0, __reg_2_1);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __LOAD(__reg_0_2, 5);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __LOAD(__reg_0_0, 6);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __STORE(3, __reg_2_2, __reg_2_0, __reg_2_1);
      __DB_SWITCH(); __syncthreads();
    }
    __b_sb = __b_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 7; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __STORE(__h - 3, __reg_2_1, __reg_2_2, __reg_2_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 3, __reg_2_2, __reg_2_0, __reg_2_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_0_0);
        __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
        __STORE(__h - 2, __reg_2_1, __reg_2_2, __reg_0_0);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_1, __h + 0);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_0_1);
        __STORE(__h - 2, __reg_2_1, __reg_2_2, __reg_2_0);
        __STORE(__h - 1, __reg_2_2, __reg_2_0, __reg_0_1);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_1, __h + 0);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
        __LOAD(__reg_0_2, __h + 1);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_1, __reg_2_2, __reg_2_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_0_2);
        __STORE(__h - 1, __reg_2_2, __reg_2_0, __reg_2_1);
        __STORE(__h + 0, __reg_2_0, __reg_2_1, __reg_0_2);
      }
    }
    else
    {
      for (__h = 7; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
        __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
        __h++;
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
        __STORE(__h - 3, __reg_2_1, __reg_2_2, __reg_2_0);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h - 3, __reg_2_2, __reg_2_0, __reg_2_1);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __CALC2(__reg_2_2, __reg_1_1, __reg_1_2, __reg_1_0);
      __STORE(__h - 3, __reg_2_0, __reg_2_1, __reg_2_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __CALC2(__reg_2_0, __reg_1_2, __reg_1_0, __reg_1_1);
      __STORE(__h - 3, __reg_2_1, __reg_2_2, __reg_2_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __CALC2(__reg_2_1, __reg_1_0, __reg_1_1, __reg_1_2);
      __STORE(__h - 3, __reg_2_2, __reg_2_0, __reg_2_1);
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
    const AN5D_TYPE __c1Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c1Pad = (1);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c2Pad = (1);
    #define __c2 c2
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 2;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 28;
    const AN5D_TYPE __side3Len = 28;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2) && __local_c3 >= (__halo3 * 2) && __local_c3 < __side3LenOl - (__halo3 * 2);
    const AN5D_TYPE __storeValid = __writeValid2;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __CALC1(out, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__writeValid1) __CALCEXPR(out, reg0, reg1, reg2); else out = reg1; } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_1_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_1_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __STORE(1, __reg_1_0, __reg_1_1, __reg_1_2);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __STORE(2, __reg_1_1, __reg_1_2, __reg_1_0);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __LOAD(__reg_0_0, 3);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __LOAD(__reg_0_1, 4);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __STORE(2, __reg_1_1, __reg_1_2, __reg_1_0);
      __DB_SWITCH(); __syncthreads();
    }
    __b_sb = __b_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 5; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_1_1);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __STORE(__h - 2, __reg_1_0, __reg_1_1, __reg_1_2);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_0);
        __h++;
      }
      if (0) {}
      else if (__h + 0 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_0_1);
      }
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_2, __h + 0);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_1_1);
        __STORE(__h - 1, __reg_1_0, __reg_1_1, __reg_0_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_2, __h + 0);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_1_1);
        __LOAD(__reg_0_0, __h + 1);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __STORE(__h - 1, __reg_1_0, __reg_1_1, __reg_1_2);
        __STORE(__h + 0, __reg_1_1, __reg_1_2, __reg_0_0);
      }
    }
    else
    {
      for (__h = 5; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_2, __h);
        __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
        __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_1_1);
        __h++;
        __LOAD(__reg_0_0, __h);
        __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
        __STORE(__h - 2, __reg_1_0, __reg_1_1, __reg_1_2);
        __h++;
        __LOAD(__reg_0_1, __h);
        __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
        __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_0);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __CALC1(__reg_1_1, __reg_0_0, __reg_0_1, __reg_0_2);
      __STORE(__h - 2, __reg_1_2, __reg_1_0, __reg_1_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __CALC1(__reg_1_2, __reg_0_1, __reg_0_2, __reg_0_0);
      __STORE(__h - 2, __reg_1_0, __reg_1_1, __reg_1_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __CALC1(__reg_1_0, __reg_0_2, __reg_0_0, __reg_0_1);
      __STORE(__h - 2, __reg_1_1, __reg_1_2, __reg_1_0);
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
    const AN5D_TYPE __c1Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c1Pad = (1);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c2Pad = (1);
    #define __c2 c2
    const AN5D_TYPE __c3Len = (dimsize - 1 - 1);
    const AN5D_TYPE __c3Pad = (1);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 1;
    const AN5D_TYPE __halo2 = 1;
    const AN5D_TYPE __halo3 = 1;
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 30;
    const AN5D_TYPE __side3Len = 30;
    const AN5D_TYPE __OlLen1 = (__halo1 * __side0Len);
    const AN5D_TYPE __OlLen2 = (__halo2 * __side0Len);
    const AN5D_TYPE __OlLen3 = (__halo3 * __side0Len);
    const AN5D_TYPE __side1LenOl = (__side1Len + 2 * __OlLen1);
    const AN5D_TYPE __side2LenOl = (__side2Len + 2 * __OlLen2);
    const AN5D_TYPE __side3LenOl = (__side3Len + 2 * __OlLen3);
    const AN5D_TYPE __blockSize = 1 * __side2LenOl * __side3LenOl;
    const AN5D_TYPE __side1Num = (__c1Len + __side1Len - 1) / __side1Len;
    const AN5D_TYPE __side2Num = (__c2Len + __side2Len - 1) / __side2Len;
    const AN5D_TYPE __side3Num = (__c3Len + __side3Len - 1) / __side3Len;
    const AN5D_TYPE __tid = threadIdx.y * blockDim.x + threadIdx.x;
    const AN5D_TYPE __local_c2 = __tid / __side3LenOl;
    const AN5D_TYPE __local_c3 = __tid % __side3LenOl;
    const AN5D_TYPE __c1Id = blockIdx.x / __side2Num / __side3Num;
    const AN5D_TYPE __c2 = (blockIdx.x / __side3Num % __side2Num) * __side2Len + __local_c2 + __c2Pad - __OlLen2;
    const AN5D_TYPE __c3 = (blockIdx.x % __side3Num) * __side3Len + __local_c3 + __c3Pad - __OlLen3;
    double __reg_0_0;
    double __reg_0_1;
    double __reg_0_2;
    __shared__ double __b_sb_double[__blockSize * 2];
    double *__b_sb = __b_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2 && __c3 >= __c3Pad - __halo3 && __c3 < __c3Pad + __c3Len + __halo3;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len && __c3 >= __c3Pad && __c3 < __c3Pad + __c3Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1) && __local_c3 >= (__halo3 * 1) && __local_c3 < __side3LenOl - (__halo3 * 1);
    const AN5D_TYPE __storeValid = __writeValid1;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[(((__c0 % 2) * dimsize + __c1) * dimsize + __c2) * dimsize + __c3]; }} while (0)
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR(__rn0, __a, __b, __c) do { __rn0 = (((((((0.2500f * (__REGREF(__b, 0, 0))) + (0.1248f * (__REGREF(__a, 0, 0)))) + (0.1249f * (__REGREF(__c, 0, 0)))) + (0.1250f * (__SBREF(__b_sb, -1, 0)))) + (0.1251f * (__SBREF(__b_sb, 1, 0)))) + (0.1252f * (__SBREF(__b_sb, 0, -1)))) + (0.1253f * (__SBREF(__b_sb, 0, 1)))); } while (0)
    #define __DB_SWITCH() do { __b_sb = &__b_sb_double[(__b_sb == __b_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a, b, c) do { __DB_SWITCH(); __b_sb[__tid] = b; __syncthreads(); } while (0)
    #define __STORE(h, reg0, reg1, reg2) do { __CALCSETUP(reg0, reg1, reg2); if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __CALCEXPR(__DEST, reg0, reg1, reg2); } } while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __STORE(1, __reg_0_0, __reg_0_1, __reg_0_2);
    }
    else
    {
      __LOAD(__reg_0_0, 0);
      __LOAD(__reg_0_1, 1);
      __LOAD(__reg_0_2, 2);
      __STORE(1, __reg_0_0, __reg_0_1, __reg_0_2);
    }
    __b_sb = __b_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 3; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __STORE(__h - 1, __reg_0_1, __reg_0_2, __reg_0_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __STORE(__h - 1, __reg_0_2, __reg_0_0, __reg_0_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __STORE(__h - 1, __reg_0_0, __reg_0_1, __reg_0_2);
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
        __STORE(__h - 1, __reg_0_1, __reg_0_2, __reg_0_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0_0, __h + 0);
        __STORE(__h - 1, __reg_0_1, __reg_0_2, __reg_0_0);
        __LOAD(__reg_0_1, __h + 1);
        __STORE(__h + 0, __reg_0_2, __reg_0_0, __reg_0_1);
      }
    }
    else
    {
      for (__h = 3; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0_0, __h);
        __STORE(__h - 1, __reg_0_1, __reg_0_2, __reg_0_0);
        __h++;
        __LOAD(__reg_0_1, __h);
        __STORE(__h - 1, __reg_0_2, __reg_0_0, __reg_0_1);
        __h++;
        __LOAD(__reg_0_2, __h);
        __STORE(__h - 1, __reg_0_0, __reg_0_1, __reg_0_2);
        __h++;
        __DB_SWITCH();  __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_0, __h);
      __STORE(__h - 1, __reg_0_1, __reg_0_2, __reg_0_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_1, __h);
      __STORE(__h - 1, __reg_0_2, __reg_0_0, __reg_0_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0_2, __h);
      __STORE(__h - 1, __reg_0_0, __reg_0_1, __reg_0_2);
      __h++;
    }
}
