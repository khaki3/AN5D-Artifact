#include "box2d1r-256-10-256_kernel.hu"
__device__ float __sbref_wrap(float *sb, size_t index) { return sb[index]; }

__global__ void kernel0_10(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 10;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 236;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_6_0;
    float __reg_6_1;
    float __reg_6_2;
    float __reg_7_0;
    float __reg_7_1;
    float __reg_7_2;
    float __reg_8_0;
    float __reg_8_1;
    float __reg_8_2;
    float __reg_9_0;
    float __reg_9_1;
    float __reg_9_2;
    float __reg_10_0;
    float __reg_10_1;
    float __reg_10_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6);
    const AN5D_TYPE __writeValid7 = __updateValid && __local_c2 >= (__halo2 * 7) && __local_c2 < __side2LenOl - (__halo2 * 7);
    const AN5D_TYPE __writeValid8 = __updateValid && __local_c2 >= (__halo2 * 8) && __local_c2 < __side2LenOl - (__halo2 * 8);
    const AN5D_TYPE __writeValid9 = __updateValid && __local_c2 >= (__halo2 * 9) && __local_c2 < __side2LenOl - (__halo2 * 9);
    const AN5D_TYPE __writeValid10 = __updateValid && __local_c2 >= (__halo2 * 10) && __local_c2 < __side2LenOl - (__halo2 * 10);
    const AN5D_TYPE __storeValid = __writeValid10;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC6(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid6) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC7(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid7) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC8(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid8) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC9(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid9) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC10(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid10) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_0);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_0);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_0);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_0);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(1, __reg_10_1);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
      __STORE(2, __reg_10_2);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __STORE(3, __reg_10_0);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(4, __reg_10_1);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
      __STORE(5, __reg_10_2);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __STORE(6, __reg_10_0);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(7, __reg_10_1);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
      __STORE(8, __reg_10_2);
      __LOAD(__reg_0, 19);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __STORE(9, __reg_10_0);
      __LOAD(__reg_0, 20);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(10, __reg_10_1);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
      __LOAD(__reg_0, 19);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __LOAD(__reg_0, 20);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(10, __reg_10_1);
      __DB_SWITCH(); __syncthreads();
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 21; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 10, __reg_10_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 10, __reg_10_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 10, __reg_10_1);
        __h++;
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 10, __reg_10_2);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 9, __reg_10_0);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 8, __reg_10_1);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 7, __reg_10_2);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 6, __reg_10_0);
        __reg_5_0 = __reg_4_0;
        __CALC6(__reg_6_1, __reg_6_1, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 5, __reg_10_1);
        __reg_6_0 = __reg_5_0;
        __CALC7(__reg_7_1, __reg_7_1, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 4, __reg_10_2);
        __reg_7_0 = __reg_6_0;
        __CALC8(__reg_8_1, __reg_8_1, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 3, __reg_10_0);
        __reg_8_0 = __reg_7_0;
        __CALC9(__reg_9_1, __reg_9_1, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 2, __reg_10_1);
        __reg_9_0 = __reg_8_0;
        __CALC10(__reg_10_1, __reg_10_1, __reg_10_2, __reg_9_0);
        __STORE(__h - 1, __reg_10_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 10, __reg_10_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 9, __reg_10_0);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 8, __reg_10_1);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 7, __reg_10_2);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 6, __reg_10_0);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 5, __reg_10_1);
        __reg_5_1 = __reg_4_1;
        __CALC6(__reg_6_2, __reg_6_2, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 4, __reg_10_2);
        __reg_6_1 = __reg_5_1;
        __CALC7(__reg_7_2, __reg_7_2, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 3, __reg_10_0);
        __reg_7_1 = __reg_6_1;
        __CALC8(__reg_8_2, __reg_8_2, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 2, __reg_10_1);
        __reg_8_1 = __reg_7_1;
        __CALC9(__reg_9_2, __reg_9_2, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 1, __reg_10_2);
        __reg_9_1 = __reg_8_1;
        __CALC10(__reg_10_2, __reg_10_2, __reg_10_0, __reg_9_1);
        __STORE(__h + 0, __reg_10_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 10, __reg_10_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 9, __reg_10_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 8, __reg_10_1);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 7, __reg_10_2);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 6, __reg_10_0);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 5, __reg_10_1);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 4, __reg_10_2);
        __reg_5_2 = __reg_4_2;
        __CALC6(__reg_6_0, __reg_6_0, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 3, __reg_10_0);
        __reg_6_2 = __reg_5_2;
        __CALC7(__reg_7_0, __reg_7_0, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 2, __reg_10_1);
        __reg_7_2 = __reg_6_2;
        __CALC8(__reg_8_0, __reg_8_0, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 1, __reg_10_2);
        __reg_8_2 = __reg_7_2;
        __CALC9(__reg_9_0, __reg_9_0, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h + 0, __reg_10_0);
        __reg_9_2 = __reg_8_2;
        __CALC10(__reg_10_0, __reg_10_0, __reg_10_1, __reg_9_2);
        __STORE(__h + 1, __reg_10_1);
      }
    }
    else
    {
      for (__h = 21; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
        __STORE(__h - 10, __reg_10_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
        __STORE(__h - 10, __reg_10_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
        __STORE(__h - 10, __reg_10_1);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __CALC10(__reg_10_1, __reg_10_0, __reg_10_2, __reg_9_0);
      __STORE(__h - 10, __reg_10_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __CALC10(__reg_10_2, __reg_10_1, __reg_10_0, __reg_9_1);
      __STORE(__h - 10, __reg_10_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __CALC10(__reg_10_0, __reg_10_2, __reg_10_1, __reg_9_2);
      __STORE(__h - 10, __reg_10_1);
      __h++;
    }
}
__global__ void kernel0_9(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 9;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 238;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_6_0;
    float __reg_6_1;
    float __reg_6_2;
    float __reg_7_0;
    float __reg_7_1;
    float __reg_7_2;
    float __reg_8_0;
    float __reg_8_1;
    float __reg_8_2;
    float __reg_9_0;
    float __reg_9_1;
    float __reg_9_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6);
    const AN5D_TYPE __writeValid7 = __updateValid && __local_c2 >= (__halo2 * 7) && __local_c2 < __side2LenOl - (__halo2 * 7);
    const AN5D_TYPE __writeValid8 = __updateValid && __local_c2 >= (__halo2 * 8) && __local_c2 < __side2LenOl - (__halo2 * 8);
    const AN5D_TYPE __writeValid9 = __updateValid && __local_c2 >= (__halo2 * 9) && __local_c2 < __side2LenOl - (__halo2 * 9);
    const AN5D_TYPE __storeValid = __writeValid9;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC6(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid6) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC7(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid7) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC8(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid8) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC9(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid9) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_0);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_0);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_0);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __STORE(1, __reg_9_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __STORE(2, __reg_9_2);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __STORE(3, __reg_9_0);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __STORE(4, __reg_9_1);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __STORE(5, __reg_9_2);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __STORE(6, __reg_9_0);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __STORE(7, __reg_9_1);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __STORE(8, __reg_9_2);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __STORE(9, __reg_9_0);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __STORE(9, __reg_9_0);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 19; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 9, __reg_9_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 9, __reg_9_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 9, __reg_9_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 9, __reg_9_1);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 8, __reg_9_2);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 7, __reg_9_0);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 6, __reg_9_1);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 5, __reg_9_2);
        __reg_5_1 = __reg_4_1;
        __CALC6(__reg_6_2, __reg_6_2, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 4, __reg_9_0);
        __reg_6_1 = __reg_5_1;
        __CALC7(__reg_7_2, __reg_7_2, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 3, __reg_9_1);
        __reg_7_1 = __reg_6_1;
        __CALC8(__reg_8_2, __reg_8_2, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 2, __reg_9_2);
        __reg_8_1 = __reg_7_1;
        __CALC9(__reg_9_2, __reg_9_2, __reg_9_0, __reg_8_1);
        __STORE(__h - 1, __reg_9_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 9, __reg_9_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 8, __reg_9_2);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 7, __reg_9_0);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 6, __reg_9_1);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 5, __reg_9_2);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 4, __reg_9_0);
        __reg_5_2 = __reg_4_2;
        __CALC6(__reg_6_0, __reg_6_0, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 3, __reg_9_1);
        __reg_6_2 = __reg_5_2;
        __CALC7(__reg_7_0, __reg_7_0, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 2, __reg_9_2);
        __reg_7_2 = __reg_6_2;
        __CALC8(__reg_8_0, __reg_8_0, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 1, __reg_9_0);
        __reg_8_2 = __reg_7_2;
        __CALC9(__reg_9_0, __reg_9_0, __reg_9_1, __reg_8_2);
        __STORE(__h + 0, __reg_9_1);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 9, __reg_9_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 8, __reg_9_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 7, __reg_9_0);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 6, __reg_9_1);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 5, __reg_9_2);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 4, __reg_9_0);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 3, __reg_9_1);
        __reg_5_0 = __reg_4_0;
        __CALC6(__reg_6_1, __reg_6_1, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 2, __reg_9_2);
        __reg_6_0 = __reg_5_0;
        __CALC7(__reg_7_1, __reg_7_1, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 1, __reg_9_0);
        __reg_7_0 = __reg_6_0;
        __CALC8(__reg_8_1, __reg_8_1, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h + 0, __reg_9_1);
        __reg_8_0 = __reg_7_0;
        __CALC9(__reg_9_1, __reg_9_1, __reg_9_2, __reg_8_0);
        __STORE(__h + 1, __reg_9_2);
      }
    }
    else
    {
      for (__h = 19; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
        __STORE(__h - 9, __reg_9_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
        __STORE(__h - 9, __reg_9_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
        __STORE(__h - 9, __reg_9_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __CALC9(__reg_9_0, __reg_9_2, __reg_9_1, __reg_8_2);
      __STORE(__h - 9, __reg_9_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __CALC9(__reg_9_1, __reg_9_0, __reg_9_2, __reg_8_0);
      __STORE(__h - 9, __reg_9_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __CALC9(__reg_9_2, __reg_9_1, __reg_9_0, __reg_8_1);
      __STORE(__h - 9, __reg_9_0);
      __h++;
    }
}
__global__ void kernel0_8(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 8;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 240;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_6_0;
    float __reg_6_1;
    float __reg_6_2;
    float __reg_7_0;
    float __reg_7_1;
    float __reg_7_2;
    float __reg_8_0;
    float __reg_8_1;
    float __reg_8_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6);
    const AN5D_TYPE __writeValid7 = __updateValid && __local_c2 >= (__halo2 * 7) && __local_c2 < __side2LenOl - (__halo2 * 7);
    const AN5D_TYPE __writeValid8 = __updateValid && __local_c2 >= (__halo2 * 8) && __local_c2 < __side2LenOl - (__halo2 * 8);
    const AN5D_TYPE __storeValid = __writeValid8;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC6(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid6) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC7(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid7) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC8(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid8) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_0);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_0);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __STORE(1, __reg_8_1);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __STORE(2, __reg_8_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __STORE(3, __reg_8_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __STORE(4, __reg_8_1);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __STORE(5, __reg_8_2);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __STORE(6, __reg_8_0);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __STORE(7, __reg_8_1);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __STORE(8, __reg_8_2);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __STORE(8, __reg_8_2);
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 17; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 8, __reg_8_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 8, __reg_8_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 8, __reg_8_2);
        __h++;
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 8, __reg_8_0);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 7, __reg_8_1);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 6, __reg_8_2);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 5, __reg_8_0);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 4, __reg_8_1);
        __reg_5_2 = __reg_4_2;
        __CALC6(__reg_6_0, __reg_6_0, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 3, __reg_8_2);
        __reg_6_2 = __reg_5_2;
        __CALC7(__reg_7_0, __reg_7_0, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 2, __reg_8_0);
        __reg_7_2 = __reg_6_2;
        __CALC8(__reg_8_0, __reg_8_0, __reg_8_1, __reg_7_2);
        __STORE(__h - 1, __reg_8_1);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 8, __reg_8_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 7, __reg_8_1);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 6, __reg_8_2);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 5, __reg_8_0);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 4, __reg_8_1);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 3, __reg_8_2);
        __reg_5_0 = __reg_4_0;
        __CALC6(__reg_6_1, __reg_6_1, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 2, __reg_8_0);
        __reg_6_0 = __reg_5_0;
        __CALC7(__reg_7_1, __reg_7_1, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 1, __reg_8_1);
        __reg_7_0 = __reg_6_0;
        __CALC8(__reg_8_1, __reg_8_1, __reg_8_2, __reg_7_0);
        __STORE(__h + 0, __reg_8_2);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 8, __reg_8_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 7, __reg_8_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 6, __reg_8_2);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 5, __reg_8_0);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 4, __reg_8_1);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 3, __reg_8_2);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 2, __reg_8_0);
        __reg_5_1 = __reg_4_1;
        __CALC6(__reg_6_2, __reg_6_2, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 1, __reg_8_1);
        __reg_6_1 = __reg_5_1;
        __CALC7(__reg_7_2, __reg_7_2, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h + 0, __reg_8_2);
        __reg_7_1 = __reg_6_1;
        __CALC8(__reg_8_2, __reg_8_2, __reg_8_0, __reg_7_1);
        __STORE(__h + 1, __reg_8_0);
      }
    }
    else
    {
      for (__h = 17; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
        __STORE(__h - 8, __reg_8_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
        __STORE(__h - 8, __reg_8_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
        __STORE(__h - 8, __reg_8_2);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __CALC8(__reg_8_2, __reg_8_1, __reg_8_0, __reg_7_1);
      __STORE(__h - 8, __reg_8_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __CALC8(__reg_8_0, __reg_8_2, __reg_8_1, __reg_7_2);
      __STORE(__h - 8, __reg_8_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __CALC8(__reg_8_1, __reg_8_0, __reg_8_2, __reg_7_0);
      __STORE(__h - 8, __reg_8_2);
      __h++;
    }
}
__global__ void kernel0_7(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 7;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 242;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_6_0;
    float __reg_6_1;
    float __reg_6_2;
    float __reg_7_0;
    float __reg_7_1;
    float __reg_7_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6);
    const AN5D_TYPE __writeValid7 = __updateValid && __local_c2 >= (__halo2 * 7) && __local_c2 < __side2LenOl - (__halo2 * 7);
    const AN5D_TYPE __storeValid = __writeValid7;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC6(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid6) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC7(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid7) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_0);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __STORE(1, __reg_7_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __STORE(2, __reg_7_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __STORE(3, __reg_7_0);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __STORE(4, __reg_7_1);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __STORE(5, __reg_7_2);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __STORE(6, __reg_7_0);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __STORE(7, __reg_7_1);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __STORE(7, __reg_7_1);
      __DB_SWITCH(); __syncthreads();
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 15; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 7, __reg_7_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 7, __reg_7_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 7, __reg_7_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 7, __reg_7_2);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 6, __reg_7_0);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 5, __reg_7_1);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 4, __reg_7_2);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 3, __reg_7_0);
        __reg_5_0 = __reg_4_0;
        __CALC6(__reg_6_1, __reg_6_1, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 2, __reg_7_1);
        __reg_6_0 = __reg_5_0;
        __CALC7(__reg_7_1, __reg_7_1, __reg_7_2, __reg_6_0);
        __STORE(__h - 1, __reg_7_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 7, __reg_7_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 6, __reg_7_0);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 5, __reg_7_1);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 4, __reg_7_2);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 3, __reg_7_0);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 2, __reg_7_1);
        __reg_5_1 = __reg_4_1;
        __CALC6(__reg_6_2, __reg_6_2, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 1, __reg_7_2);
        __reg_6_1 = __reg_5_1;
        __CALC7(__reg_7_2, __reg_7_2, __reg_7_0, __reg_6_1);
        __STORE(__h + 0, __reg_7_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 7, __reg_7_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 6, __reg_7_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 5, __reg_7_1);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 4, __reg_7_2);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 3, __reg_7_0);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 2, __reg_7_1);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 1, __reg_7_2);
        __reg_5_2 = __reg_4_2;
        __CALC6(__reg_6_0, __reg_6_0, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h + 0, __reg_7_0);
        __reg_6_2 = __reg_5_2;
        __CALC7(__reg_7_0, __reg_7_0, __reg_7_1, __reg_6_2);
        __STORE(__h + 1, __reg_7_1);
      }
    }
    else
    {
      for (__h = 15; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
        __STORE(__h - 7, __reg_7_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
        __STORE(__h - 7, __reg_7_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
        __STORE(__h - 7, __reg_7_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __CALC7(__reg_7_1, __reg_7_0, __reg_7_2, __reg_6_0);
      __STORE(__h - 7, __reg_7_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __CALC7(__reg_7_2, __reg_7_1, __reg_7_0, __reg_6_1);
      __STORE(__h - 7, __reg_7_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __CALC7(__reg_7_0, __reg_7_2, __reg_7_1, __reg_6_2);
      __STORE(__h - 7, __reg_7_1);
      __h++;
    }
}
__global__ void kernel0_6(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 6;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 244;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_6_0;
    float __reg_6_1;
    float __reg_6_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __writeValid6 = __updateValid && __local_c2 >= (__halo2 * 6) && __local_c2 < __side2LenOl - (__halo2 * 6);
    const AN5D_TYPE __storeValid = __writeValid6;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC6(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid6) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __STORE(1, __reg_6_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __STORE(2, __reg_6_2);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __STORE(3, __reg_6_0);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __STORE(4, __reg_6_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __STORE(5, __reg_6_2);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __STORE(6, __reg_6_0);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __STORE(6, __reg_6_0);
      __DB_SWITCH(); __syncthreads();
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 13; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 6, __reg_6_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 6, __reg_6_0);
        __h++;
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_1);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_2);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_0);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 3, __reg_6_1);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 2, __reg_6_2);
        __reg_5_1 = __reg_4_1;
        __CALC6(__reg_6_2, __reg_6_2, __reg_6_0, __reg_5_1);
        __STORE(__h - 1, __reg_6_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_2);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_0);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 3, __reg_6_1);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 2, __reg_6_2);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 1, __reg_6_0);
        __reg_5_2 = __reg_4_2;
        __CALC6(__reg_6_0, __reg_6_0, __reg_6_1, __reg_5_2);
        __STORE(__h + 0, __reg_6_1);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 5, __reg_6_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 4, __reg_6_0);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 3, __reg_6_1);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 2, __reg_6_2);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 1, __reg_6_0);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h + 0, __reg_6_1);
        __reg_5_0 = __reg_4_0;
        __CALC6(__reg_6_1, __reg_6_1, __reg_6_2, __reg_5_0);
        __STORE(__h + 1, __reg_6_2);
      }
    }
    else
    {
      for (__h = 13; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
        __STORE(__h - 6, __reg_6_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
        __STORE(__h - 6, __reg_6_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
        __STORE(__h - 6, __reg_6_0);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __CALC6(__reg_6_0, __reg_6_2, __reg_6_1, __reg_5_2);
      __STORE(__h - 6, __reg_6_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __CALC6(__reg_6_1, __reg_6_0, __reg_6_2, __reg_5_0);
      __STORE(__h - 6, __reg_6_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __CALC6(__reg_6_2, __reg_6_1, __reg_6_0, __reg_5_1);
      __STORE(__h - 6, __reg_6_0);
      __h++;
    }
}
__global__ void kernel0_5(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 5;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 246;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
    const AN5D_TYPE __loadValid = 1 && __c2 >= __c2Pad - __halo2 && __c2 < __c2Pad + __c2Len + __halo2;
    const AN5D_TYPE __updateValid = 1 && __c2 >= __c2Pad && __c2 < __c2Pad + __c2Len;
    const AN5D_TYPE __writeValid1 = __updateValid && __local_c2 >= (__halo2 * 1) && __local_c2 < __side2LenOl - (__halo2 * 1);
    const AN5D_TYPE __writeValid2 = __updateValid && __local_c2 >= (__halo2 * 2) && __local_c2 < __side2LenOl - (__halo2 * 2);
    const AN5D_TYPE __writeValid3 = __updateValid && __local_c2 >= (__halo2 * 3) && __local_c2 < __side2LenOl - (__halo2 * 3);
    const AN5D_TYPE __writeValid4 = __updateValid && __local_c2 >= (__halo2 * 4) && __local_c2 < __side2LenOl - (__halo2 * 4);
    const AN5D_TYPE __writeValid5 = __updateValid && __local_c2 >= (__halo2 * 5) && __local_c2 < __side2LenOl - (__halo2 * 5);
    const AN5D_TYPE __storeValid = __writeValid5;
    AN5D_TYPE __c1;
    AN5D_TYPE __h;
    const AN5D_TYPE __c1Pad2 = __c1Pad + __side1Len * __c1Id;
    #define __LOAD(reg, h) do { if (__loadValid) { __c1 = __c1Pad2 - __halo1 + h; reg = A[((__c0 % 2) * dimsize + __c1) * dimsize + __c2]; }} while (0)
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC5(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __STORE(1, __reg_5_1);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __STORE(2, __reg_5_2);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __STORE(3, __reg_5_0);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __STORE(4, __reg_5_1);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __STORE(5, __reg_5_2);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __STORE(5, __reg_5_2);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 11; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 5, __reg_5_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h - 5, __reg_5_2);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_0);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_1);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h - 3, __reg_5_2);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 2, __reg_5_0);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_1, __reg_4_2);
        __STORE(__h - 1, __reg_5_1);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_1);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h - 3, __reg_5_2);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 2, __reg_5_0);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 1, __reg_5_1);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_2, __reg_4_0);
        __STORE(__h + 0, __reg_5_2);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 4, __reg_5_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h - 3, __reg_5_2);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 2, __reg_5_0);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 1, __reg_5_1);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h + 0, __reg_5_2);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_0, __reg_4_1);
        __STORE(__h + 1, __reg_5_0);
      }
    }
    else
    {
      for (__h = 11; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
        __STORE(__h - 5, __reg_5_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
        __STORE(__h - 5, __reg_5_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
        __STORE(__h - 5, __reg_5_2);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_4_1);
      __STORE(__h - 5, __reg_5_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_2, __reg_5_1, __reg_4_2);
      __STORE(__h - 5, __reg_5_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_2, __reg_4_0);
      __STORE(__h - 5, __reg_5_2);
      __h++;
    }
}
__global__ void kernel0_4(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 4;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 248;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC4(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __STORE(1, __reg_4_1);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __STORE(2, __reg_4_2);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __STORE(3, __reg_4_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __STORE(4, __reg_4_1);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __STORE(4, __reg_4_1);
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 9; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h - 4, __reg_4_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __STORE(__h - 4, __reg_4_1);
        __h++;
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_2);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h - 3, __reg_4_0);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __STORE(__h - 2, __reg_4_1);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_2, __reg_3_0);
        __STORE(__h - 1, __reg_4_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h - 3, __reg_4_0);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __STORE(__h - 2, __reg_4_1);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 1, __reg_4_2);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_0, __reg_3_1);
        __STORE(__h + 0, __reg_4_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h - 3, __reg_4_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __STORE(__h - 2, __reg_4_1);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 1, __reg_4_2);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h + 0, __reg_4_0);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_1, __reg_3_2);
        __STORE(__h + 1, __reg_4_1);
      }
    }
    else
    {
      for (__h = 9; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
        __STORE(__h - 4, __reg_4_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
        __STORE(__h - 4, __reg_4_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
        __STORE(__h - 4, __reg_4_1);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_2, __reg_3_0);
      __STORE(__h - 4, __reg_4_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_3_1);
      __STORE(__h - 4, __reg_4_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_2, __reg_4_1, __reg_3_2);
      __STORE(__h - 4, __reg_4_1);
      __h++;
    }
}
__global__ void kernel0_3(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 3;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 250;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC3(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __STORE(1, __reg_3_1);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __STORE(2, __reg_3_2);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __STORE(3, __reg_3_0);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __STORE(3, __reg_3_0);
      __DB_SWITCH(); __syncthreads();
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 7; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __STORE(__h - 3, __reg_3_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __STORE(__h - 3, __reg_3_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_1);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __STORE(__h - 2, __reg_3_2);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_0, __reg_2_1);
        __STORE(__h - 1, __reg_3_0);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __STORE(__h - 2, __reg_3_2);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __STORE(__h - 1, __reg_3_0);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_1, __reg_2_2);
        __STORE(__h + 0, __reg_3_1);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __STORE(__h - 2, __reg_3_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __STORE(__h - 1, __reg_3_0);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h + 0, __reg_3_1);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_2, __reg_2_0);
        __STORE(__h + 1, __reg_3_2);
      }
    }
    else
    {
      for (__h = 7; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
        __STORE(__h - 3, __reg_3_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
        __STORE(__h - 3, __reg_3_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
        __STORE(__h - 3, __reg_3_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_2, __reg_3_1, __reg_2_2);
      __STORE(__h - 3, __reg_3_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_2, __reg_2_0);
      __STORE(__h - 3, __reg_3_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_2_1);
      __STORE(__h - 3, __reg_3_0);
      __h++;
    }
}
__global__ void kernel0_2(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 2;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 252;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __CALC2(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __STORE(1, __reg_2_1);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __STORE(2, __reg_2_2);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __STORE(2, __reg_2_2);
      __DB_SWITCH(); __syncthreads();
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 5; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __STORE(__h - 2, __reg_2_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __STORE(__h - 2, __reg_2_2);
        __h++;
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_0);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_1, __reg_1_2);
        __STORE(__h - 1, __reg_2_1);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __STORE(__h - 1, __reg_2_1);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_2, __reg_1_0);
        __STORE(__h + 0, __reg_2_2);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __STORE(__h - 1, __reg_2_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __STORE(__h + 0, __reg_2_2);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_0, __reg_1_1);
        __STORE(__h + 1, __reg_2_0);
      }
    }
    else
    {
      for (__h = 5; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
        __STORE(__h - 2, __reg_2_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
        __STORE(__h - 2, __reg_2_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
        __STORE(__h - 2, __reg_2_2);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_1_1);
      __STORE(__h - 2, __reg_2_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __CALC2(__reg_2_0, __reg_2_2, __reg_2_1, __reg_1_2);
      __STORE(__h - 2, __reg_2_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_2, __reg_1_0);
      __STORE(__h - 2, __reg_2_2);
      __h++;
    }
}
__global__ void kernel0_1(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 256;
    const AN5D_TYPE __side2Len = 254;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((0.09371f * (__SBREF(__a_sb, -1))) + (0.09374f * (__REGREF(__a, 0)))) + (0.09376f * (__SBREF(__a_sb, 1)))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((0.09372f * (__SBREF(__a_sb, -1)))) + (0.25001f * (__REGREF(__a, 0)))) + (0.09377f * (__SBREF(__a_sb, 1))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((0.09373f * (__SBREF(__a_sb, -1)))) + (0.09375f * (__REGREF(__a, 0)))) + (0.09378f * (__SBREF(__a_sb, 1)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); } while (0);
    #define __CALC1(out0, out1, out2, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, reg); } else out1 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(1, __reg_1_1);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(1, __reg_1_1);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 3; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 4;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __STORE(__h - 1, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 1, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 1, __reg_1_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 1 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __STORE(__h - 1, __reg_1_2);
      }
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __STORE(__h - 1, __reg_1_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __STORE(__h - 1, __reg_1_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
      }
    }
    else
    {
      for (__h = 3; __h <= __side1LenOl - 3;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
        __STORE(__h - 1, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 1, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 1, __reg_1_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_2, __reg_0);
      __STORE(__h - 1, __reg_1_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __STORE(__h - 1, __reg_1_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(__h - 1, __reg_1_1);
      __h++;
    }
}
