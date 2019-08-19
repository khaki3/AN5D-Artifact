#include "box2d4r-128-1-128_kernel.hu"
__device__ double __sbref_wrap(double *sb, size_t index) { return sb[index]; }

__global__ void kernel0_1(double *A, int dimsize, int timestep, int c0)
{
#ifndef AN5D_TYPE
#define AN5D_TYPE unsigned
#endif
    const AN5D_TYPE __c0Len = (timestep - 0);
    const AN5D_TYPE __c0Pad = (0);
    #define __c0 c0
    const AN5D_TYPE __c1Len = (dimsize - 4 - 4);
    const AN5D_TYPE __c1Pad = (4);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 4 - 4);
    const AN5D_TYPE __c2Pad = (4);
    #define __c2 c2
    const AN5D_TYPE __halo1 = 4;
    const AN5D_TYPE __halo2 = 4;
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 120;
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
    double __reg_0;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_1_3;
    double __reg_1_4;
    double __reg_1_5;
    double __reg_1_6;
    double __reg_1_7;
    double __reg_1_8;
    __shared__ double __a_sb_double[__blockSize * 2];
    double *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.00930f * (__SBREF(__a_sb, -4))) + (0.00931f * (__SBREF(__a_sb, -3)))) + (0.00932f * (__SBREF(__a_sb, -2)))) + (0.00933f * (__SBREF(__a_sb, -1)))) + (0.00934f * (__REGREF(__a, 0)))) + (0.00935f * (__SBREF(__a_sb, 1)))) + (0.00936f * (__SBREF(__a_sb, 2)))) + (0.00937f * (__SBREF(__a_sb, 3)))) + (0.00938f * (__SBREF(__a_sb, 4)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.00939f * (__SBREF(__a_sb, -4)))) + (0.00940f * (__SBREF(__a_sb, -3)))) + (0.00941f * (__SBREF(__a_sb, -2)))) + (0.00942f * (__SBREF(__a_sb, -1)))) + (0.00943f * (__REGREF(__a, 0)))) + (0.00944f * (__SBREF(__a_sb, 1)))) + (0.00945f * (__SBREF(__a_sb, 2)))) + (0.00946f * (__SBREF(__a_sb, 3)))) + (0.00947f * (__SBREF(__a_sb, 4))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { double etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.00948f * (__SBREF(__a_sb, -4)))) + (0.00949f * (__SBREF(__a_sb, -3)))) + (0.00950f * (__SBREF(__a_sb, -2)))) + (0.00951f * (__SBREF(__a_sb, -1)))) + (0.00952f * (__REGREF(__a, 0)))) + (0.00953f * (__SBREF(__a_sb, 1)))) + (0.00954f * (__SBREF(__a_sb, 2)))) + (0.00955f * (__SBREF(__a_sb, 3)))) + (0.00956f * (__SBREF(__a_sb, 4)))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { double etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((((((((((((((((((((0.00957f * (__SBREF(__a_sb, -4)))) + (0.00958f * (__SBREF(__a_sb, -3)))) + (0.00959f * (__SBREF(__a_sb, -2)))) + (0.00960f * (__SBREF(__a_sb, -1)))) + (0.00961f * (__REGREF(__a, 0)))) + (0.00962f * (__SBREF(__a_sb, 1)))) + (0.00963f * (__SBREF(__a_sb, 2)))) + (0.00964f * (__SBREF(__a_sb, 3)))) + (0.00965f * (__SBREF(__a_sb, 4))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { double etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((0.00966f * (__SBREF(__a_sb, -4)))) + (0.00967f * (__SBREF(__a_sb, -3)))) + (0.00968f * (__SBREF(__a_sb, -2)))) + (0.00969f * (__SBREF(__a_sb, -1)))) + (0.22400f * (__REGREF(__a, 0)))) + (0.00971f * (__SBREF(__a_sb, 1)))) + (0.00972f * (__SBREF(__a_sb, 2)))) + (0.00973f * (__SBREF(__a_sb, 3)))) + (0.00974f * (__SBREF(__a_sb, 4)))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { double etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_5_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((0.00975f * (__SBREF(__a_sb, -4)))) + (0.00976f * (__SBREF(__a_sb, -3)))) + (0.00977f * (__SBREF(__a_sb, -2)))) + (0.00978f * (__SBREF(__a_sb, -1)))) + (0.00979f * (__REGREF(__a, 0)))) + (0.00980f * (__SBREF(__a_sb, 1)))) + (0.00981f * (__SBREF(__a_sb, 2)))) + (0.00982f * (__SBREF(__a_sb, 3)))) + (0.00983f * (__SBREF(__a_sb, 4))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_5(out, a) do { double etmp; __CALCEXPR_5_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_6_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((0.00984f * (__SBREF(__a_sb, -4)))) + (0.00985f * (__SBREF(__a_sb, -3)))) + (0.00986f * (__SBREF(__a_sb, -2)))) + (0.00987f * (__SBREF(__a_sb, -1)))) + (0.00988f * (__REGREF(__a, 0)))) + (0.00989f * (__SBREF(__a_sb, 1)))) + (0.00990f * (__SBREF(__a_sb, 2)))) + (0.00991f * (__SBREF(__a_sb, 3)))) + (0.00992f * (__SBREF(__a_sb, 4)))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_6(out, a) do { double etmp; __CALCEXPR_6_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_7_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((0.00993f * (__SBREF(__a_sb, -4)))) + (0.00994f * (__SBREF(__a_sb, -3)))) + (0.00995f * (__SBREF(__a_sb, -2)))) + (0.00996f * (__SBREF(__a_sb, -1)))) + (0.00997f * (__REGREF(__a, 0)))) + (0.00998f * (__SBREF(__a_sb, 1)))) + (0.00999f * (__SBREF(__a_sb, 2)))) + (0.01000f * (__SBREF(__a_sb, 3)))) + (0.01001f * (__SBREF(__a_sb, 4))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_7(out, a) do { double etmp; __CALCEXPR_7_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_8_wrap(__rn0, __a) do { __rn0 = ((((((((((0.01002f * (__SBREF(__a_sb, -4)))) + (0.01003f * (__SBREF(__a_sb, -3)))) + (0.01004f * (__SBREF(__a_sb, -2)))) + (0.01005f * (__SBREF(__a_sb, -1)))) + (0.01006f * (__REGREF(__a, 0)))) + (0.01007f * (__SBREF(__a_sb, 1)))) + (0.01008f * (__SBREF(__a_sb, 2)))) + (0.01009f * (__SBREF(__a_sb, 3)))) + (0.01010f * (__SBREF(__a_sb, 4)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_8(out, a) do { double etmp; __CALCEXPR_8_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, out5, out6, out7, out8, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); __CALCEXPR_5(out5, reg); __CALCEXPR_6(out6, reg); __CALCEXPR_7(out7, reg); __CALCEXPR_8(out8, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, out5, out6, out7, out8, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, out5, out6, out7, out8, reg); } else out4 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __STORE(4, __reg_1_4);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __STORE(4, __reg_1_4);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 9; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 13;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 4, __reg_1_6);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 4, __reg_1_7);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 4, __reg_1_8);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 4, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 4, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 4, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 4, __reg_1_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 4, __reg_1_4);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
      }
      else if (__h + 7 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_7, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
      }
      else if (__h + 8 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_8, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
      }
      else if (__h + 9 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 8);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
      }
      else if (__h + 10 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 8);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
        __LOAD(__reg_0, __h + 9);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_5, __reg_0);
        __STORE(__h + 5, __reg_1_5);
      }
      else if (__h + 11 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 8);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
        __LOAD(__reg_0, __h + 9);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h + 5, __reg_1_5);
        __LOAD(__reg_0, __h + 10);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_6, __reg_0);
        __STORE(__h + 6, __reg_1_6);
      }
      else if (__h + 12 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 2, __reg_1_7);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 1, __reg_1_8);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 8);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
        __LOAD(__reg_0, __h + 9);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h + 5, __reg_1_5);
        __LOAD(__reg_0, __h + 10);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h + 6, __reg_1_6);
        __LOAD(__reg_0, __h + 11);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_7, __reg_0);
        __STORE(__h + 7, __reg_1_7);
      }
    }
    else
    {
      for (__h = 9; __h <= __side1LenOl - 9;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 4, __reg_1_5);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
        __STORE(__h - 4, __reg_1_6);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
        __STORE(__h - 4, __reg_1_7);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
        __STORE(__h - 4, __reg_1_8);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 4, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 4, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 4, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 4, __reg_1_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 4, __reg_1_4);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_0);
      __STORE(__h - 4, __reg_1_5);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_0);
      __STORE(__h - 4, __reg_1_6);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_0);
      __STORE(__h - 4, __reg_1_7);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_0);
      __STORE(__h - 4, __reg_1_8);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __STORE(__h - 4, __reg_1_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(__h - 4, __reg_1_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __STORE(__h - 4, __reg_1_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __STORE(__h - 4, __reg_1_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_8, __reg_1_7, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __STORE(__h - 4, __reg_1_4);
      __h++;
    }
}
