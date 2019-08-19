#include "box2d2r-256-5-256_kernel.hu"
__device__ float __sbref_wrap(float *sb, size_t index) { return sb[index]; }

__global__ void kernel0_5(float *A, int dimsize, int timestep, int c0)
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
    const AN5D_TYPE __side0Len = 5;
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
    float __reg_1_3;
    float __reg_1_4;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_2_3;
    float __reg_2_4;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_3_3;
    float __reg_3_4;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_4_3;
    float __reg_4_4;
    float __reg_5_0;
    float __reg_5_1;
    float __reg_5_2;
    float __reg_5_3;
    float __reg_5_4;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((0.03125f * (__SBREF(__a_sb, -2))) + (0.03126f * (__SBREF(__a_sb, -1)))) + (0.03127f * (__REGREF(__a, 0)))) + (0.03128f * (__SBREF(__a_sb, 1)))) + (0.03129f * (__SBREF(__a_sb, 2)))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((0.03130f * (__SBREF(__a_sb, -2)))) + (0.03131f * (__SBREF(__a_sb, -1)))) + (0.03132f * (__REGREF(__a, 0)))) + (0.03133f * (__SBREF(__a_sb, 1)))) + (0.03134f * (__SBREF(__a_sb, 2))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((0.03135f * (__SBREF(__a_sb, -2)))) + (0.03136f * (__SBREF(__a_sb, -1)))) + (0.24712f * (__REGREF(__a, 0)))) + (0.03138f * (__SBREF(__a_sb, 1)))) + (0.03139f * (__SBREF(__a_sb, 2)))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((0.03140f * (__SBREF(__a_sb, -2)))) + (0.03141f * (__SBREF(__a_sb, -1)))) + (0.03142f * (__REGREF(__a, 0)))) + (0.03143f * (__SBREF(__a_sb, 1)))) + (0.03144f * (__SBREF(__a_sb, 2))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((0.03145f * (__SBREF(__a_sb, -2)))) + (0.03146f * (__SBREF(__a_sb, -1)))) + (0.03147f * (__REGREF(__a, 0)))) + (0.03148f * (__SBREF(__a_sb, 1)))) + (0.03149f * (__SBREF(__a_sb, 2)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { float etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC2(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC3(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC4(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC5(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid5) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_0);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_0);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_0);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_0);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_0);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_0);
      __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
      __STORE(2, __reg_5_2);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
      __STORE(3, __reg_5_3);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
      __STORE(4, __reg_5_4);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
      __STORE(5, __reg_5_0);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
      __STORE(6, __reg_5_1);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
      __STORE(7, __reg_5_2);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
      __STORE(8, __reg_5_3);
      __LOAD(__reg_0, 19);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
      __STORE(9, __reg_5_4);
      __LOAD(__reg_0, 20);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
      __STORE(10, __reg_5_0);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
      __LOAD(__reg_0, 17);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
      __LOAD(__reg_0, 18);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
      __LOAD(__reg_0, 19);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
      __LOAD(__reg_0, 20);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
      __STORE(10, __reg_5_0);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 21; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 10, __reg_5_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 10, __reg_5_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 10, __reg_5_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 10, __reg_5_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __reg_1_1 = __reg_0;
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 9, __reg_5_2);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 8, __reg_5_3);
        __reg_2_1 = __reg_1_1;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_4, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 7, __reg_5_4);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 6, __reg_5_0);
        __reg_3_1 = __reg_2_1;
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_4, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 5, __reg_5_1);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_3, __reg_4_3, __reg_4_3, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 4, __reg_5_2);
        __reg_4_1 = __reg_3_1;
        __CALC4(__reg_4_4, __reg_4_4, __reg_4_4, __reg_4_4, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 3, __reg_5_3);
        __reg_4_2 = __reg_3_2;
        __CALC5(__reg_5_3, __reg_5_3, __reg_5_3, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 2, __reg_5_4);
        __CALC5(__reg_5_4, __reg_5_4, __reg_5_4, __reg_5_4, __reg_5_0, __reg_4_2);
        __STORE(__h - 1, __reg_5_0);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 9, __reg_5_2);
        __reg_1_2 = __reg_0;
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 8, __reg_5_3);
        __reg_1_3 = __reg_0;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 7, __reg_5_4);
        __reg_2_2 = __reg_1_2;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_0, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 6, __reg_5_0);
        __reg_2_3 = __reg_1_3;
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 5, __reg_5_1);
        __reg_3_2 = __reg_2_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_0, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 4, __reg_5_2);
        __reg_3_3 = __reg_2_3;
        __CALC4(__reg_4_4, __reg_4_4, __reg_4_4, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 3, __reg_5_3);
        __reg_4_2 = __reg_3_2;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_0, __reg_4_0, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 2, __reg_5_4);
        __reg_4_3 = __reg_3_3;
        __CALC5(__reg_5_4, __reg_5_4, __reg_5_4, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 1, __reg_5_0);
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_0, __reg_5_0, __reg_5_1, __reg_4_3);
        __STORE(__h + 0, __reg_5_1);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 9, __reg_5_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 8, __reg_5_3);
        __reg_1_3 = __reg_0;
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 7, __reg_5_4);
        __reg_1_4 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 6, __reg_5_0);
        __reg_2_3 = __reg_1_3;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_1, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 5, __reg_5_1);
        __reg_2_4 = __reg_1_4;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 4, __reg_5_2);
        __reg_3_3 = __reg_2_3;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_1, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 3, __reg_5_3);
        __reg_3_4 = __reg_2_4;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_0, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 2, __reg_5_4);
        __reg_4_3 = __reg_3_3;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_1, __reg_4_1, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 1, __reg_5_0);
        __reg_4_4 = __reg_3_4;
        __CALC5(__reg_5_0, __reg_5_0, __reg_5_0, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h + 0, __reg_5_1);
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_1, __reg_5_1, __reg_5_2, __reg_4_4);
        __STORE(__h + 1, __reg_5_2);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 9, __reg_5_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 8, __reg_5_3);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 7, __reg_5_4);
        __reg_1_4 = __reg_0;
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 6, __reg_5_0);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 5, __reg_5_1);
        __reg_2_4 = __reg_1_4;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_2, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 4, __reg_5_2);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 3, __reg_5_3);
        __reg_3_4 = __reg_2_4;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_2, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 2, __reg_5_4);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_1, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 1, __reg_5_0);
        __reg_4_4 = __reg_3_4;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_2, __reg_4_2, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h + 0, __reg_5_1);
        __reg_4_0 = __reg_3_0;
        __CALC5(__reg_5_1, __reg_5_1, __reg_5_1, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h + 1, __reg_5_2);
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_2, __reg_5_2, __reg_5_3, __reg_4_0);
        __STORE(__h + 2, __reg_5_3);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 9, __reg_5_2);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 8, __reg_5_3);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 7, __reg_5_4);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 6, __reg_5_0);
        __reg_1_0 = __reg_0;
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 5, __reg_5_1);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 4, __reg_5_2);
        __reg_2_0 = __reg_1_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_3, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 3, __reg_5_3);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 2, __reg_5_4);
        __reg_3_0 = __reg_2_0;
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_3, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 1, __reg_5_0);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_2, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h + 0, __reg_5_1);
        __reg_4_0 = __reg_3_0;
        __CALC4(__reg_4_3, __reg_4_3, __reg_4_3, __reg_4_3, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h + 1, __reg_5_2);
        __reg_4_1 = __reg_3_1;
        __CALC5(__reg_5_2, __reg_5_2, __reg_5_2, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h + 2, __reg_5_3);
        __CALC5(__reg_5_3, __reg_5_3, __reg_5_3, __reg_5_3, __reg_5_4, __reg_4_1);
        __STORE(__h + 3, __reg_5_4);
      }
    }
    else
    {
      for (__h = 21; __h <= __side1LenOl - 5;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
        __STORE(__h - 10, __reg_5_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
        __STORE(__h - 10, __reg_5_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
        __STORE(__h - 10, __reg_5_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
        __STORE(__h - 10, __reg_5_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
        __STORE(__h - 10, __reg_5_0);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __CALC5(__reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_4_3);
      __STORE(__h - 10, __reg_5_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __CALC5(__reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_5_2, __reg_4_4);
      __STORE(__h - 10, __reg_5_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __CALC5(__reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_5_3, __reg_4_0);
      __STORE(__h - 10, __reg_5_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __CALC5(__reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_5_4, __reg_4_1);
      __STORE(__h - 10, __reg_5_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __CALC5(__reg_5_4, __reg_5_3, __reg_5_2, __reg_5_1, __reg_5_0, __reg_4_2);
      __STORE(__h - 10, __reg_5_0);
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
    const AN5D_TYPE __c1Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c1Pad = (2);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c2Pad = (2);
    #define __c2 c2
    const AN5D_TYPE __halo1 = 2;
    const AN5D_TYPE __halo2 = 2;
    const AN5D_TYPE __side0Len = 4;
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
    float __reg_1_3;
    float __reg_1_4;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_2_3;
    float __reg_2_4;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_3_3;
    float __reg_3_4;
    float __reg_4_0;
    float __reg_4_1;
    float __reg_4_2;
    float __reg_4_3;
    float __reg_4_4;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((0.03125f * (__SBREF(__a_sb, -2))) + (0.03126f * (__SBREF(__a_sb, -1)))) + (0.03127f * (__REGREF(__a, 0)))) + (0.03128f * (__SBREF(__a_sb, 1)))) + (0.03129f * (__SBREF(__a_sb, 2)))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((0.03130f * (__SBREF(__a_sb, -2)))) + (0.03131f * (__SBREF(__a_sb, -1)))) + (0.03132f * (__REGREF(__a, 0)))) + (0.03133f * (__SBREF(__a_sb, 1)))) + (0.03134f * (__SBREF(__a_sb, 2))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((0.03135f * (__SBREF(__a_sb, -2)))) + (0.03136f * (__SBREF(__a_sb, -1)))) + (0.24712f * (__REGREF(__a, 0)))) + (0.03138f * (__SBREF(__a_sb, 1)))) + (0.03139f * (__SBREF(__a_sb, 2)))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((0.03140f * (__SBREF(__a_sb, -2)))) + (0.03141f * (__SBREF(__a_sb, -1)))) + (0.03142f * (__REGREF(__a, 0)))) + (0.03143f * (__SBREF(__a_sb, 1)))) + (0.03144f * (__SBREF(__a_sb, 2))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((0.03145f * (__SBREF(__a_sb, -2)))) + (0.03146f * (__SBREF(__a_sb, -1)))) + (0.03147f * (__REGREF(__a, 0)))) + (0.03148f * (__SBREF(__a_sb, 1)))) + (0.03149f * (__SBREF(__a_sb, 2)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { float etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC2(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC3(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC4(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid4) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_0);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_0);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_0);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_0);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __STORE(2, __reg_4_2);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __STORE(3, __reg_4_3);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __STORE(4, __reg_4_4);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __STORE(5, __reg_4_0);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __STORE(6, __reg_4_1);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __STORE(7, __reg_4_2);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __STORE(8, __reg_4_3);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __LOAD(__reg_0, 13);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __LOAD(__reg_0, 14);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __LOAD(__reg_0, 15);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __LOAD(__reg_0, 16);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __STORE(8, __reg_4_3);
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 17; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 8, __reg_4_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 8, __reg_4_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 8, __reg_4_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 8, __reg_4_3);
        __h++;
      }
      if (0) {}
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __reg_1_2 = __reg_0;
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 7, __reg_4_0);
        __reg_1_3 = __reg_0;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 6, __reg_4_1);
        __reg_2_2 = __reg_1_2;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_0, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 5, __reg_4_2);
        __reg_2_3 = __reg_1_3;
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 4, __reg_4_3);
        __reg_3_2 = __reg_2_2;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_0, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 3, __reg_4_4);
        __reg_3_3 = __reg_2_3;
        __CALC4(__reg_4_4, __reg_4_4, __reg_4_4, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 2, __reg_4_0);
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_0, __reg_4_0, __reg_4_1, __reg_3_3);
        __STORE(__h - 1, __reg_4_1);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 7, __reg_4_0);
        __reg_1_3 = __reg_0;
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 6, __reg_4_1);
        __reg_1_4 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 5, __reg_4_2);
        __reg_2_3 = __reg_1_3;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_1, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 4, __reg_4_3);
        __reg_2_4 = __reg_1_4;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 3, __reg_4_4);
        __reg_3_3 = __reg_2_3;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_1, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 2, __reg_4_0);
        __reg_3_4 = __reg_2_4;
        __CALC4(__reg_4_0, __reg_4_0, __reg_4_0, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 1, __reg_4_1);
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_1, __reg_4_1, __reg_4_2, __reg_3_4);
        __STORE(__h + 0, __reg_4_2);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 7, __reg_4_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 6, __reg_4_1);
        __reg_1_4 = __reg_0;
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 5, __reg_4_2);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 4, __reg_4_3);
        __reg_2_4 = __reg_1_4;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_2, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 3, __reg_4_4);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 2, __reg_4_0);
        __reg_3_4 = __reg_2_4;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_2, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 1, __reg_4_1);
        __reg_3_0 = __reg_2_0;
        __CALC4(__reg_4_1, __reg_4_1, __reg_4_1, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h + 0, __reg_4_2);
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_2, __reg_4_2, __reg_4_3, __reg_3_0);
        __STORE(__h + 1, __reg_4_3);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 7, __reg_4_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 6, __reg_4_1);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 5, __reg_4_2);
        __reg_1_0 = __reg_0;
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 4, __reg_4_3);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 3, __reg_4_4);
        __reg_2_0 = __reg_1_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_3, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 2, __reg_4_0);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 1, __reg_4_1);
        __reg_3_0 = __reg_2_0;
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_3, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h + 0, __reg_4_2);
        __reg_3_1 = __reg_2_1;
        __CALC4(__reg_4_2, __reg_4_2, __reg_4_2, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h + 1, __reg_4_3);
        __CALC4(__reg_4_3, __reg_4_3, __reg_4_3, __reg_4_3, __reg_4_4, __reg_3_1);
        __STORE(__h + 2, __reg_4_4);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 7, __reg_4_0);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 6, __reg_4_1);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 5, __reg_4_2);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 4, __reg_4_3);
        __reg_1_1 = __reg_0;
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 3, __reg_4_4);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 2, __reg_4_0);
        __reg_2_1 = __reg_1_1;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_4, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 1, __reg_4_1);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h + 0, __reg_4_2);
        __reg_3_1 = __reg_2_1;
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_4, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h + 1, __reg_4_3);
        __reg_3_2 = __reg_2_2;
        __CALC4(__reg_4_3, __reg_4_3, __reg_4_3, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h + 2, __reg_4_4);
        __CALC4(__reg_4_4, __reg_4_4, __reg_4_4, __reg_4_4, __reg_4_0, __reg_3_2);
        __STORE(__h + 3, __reg_4_0);
      }
    }
    else
    {
      for (__h = 17; __h <= __side1LenOl - 5;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
        __STORE(__h - 8, __reg_4_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
        __STORE(__h - 8, __reg_4_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
        __STORE(__h - 8, __reg_4_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
        __STORE(__h - 8, __reg_4_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
        __STORE(__h - 8, __reg_4_3);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __CALC4(__reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_3_1);
      __STORE(__h - 8, __reg_4_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __CALC4(__reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_4_0, __reg_3_2);
      __STORE(__h - 8, __reg_4_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __CALC4(__reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_4_1, __reg_3_3);
      __STORE(__h - 8, __reg_4_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __CALC4(__reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_4_2, __reg_3_4);
      __STORE(__h - 8, __reg_4_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __CALC4(__reg_4_2, __reg_4_1, __reg_4_0, __reg_4_4, __reg_4_3, __reg_3_0);
      __STORE(__h - 8, __reg_4_3);
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
    const AN5D_TYPE __c1Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c1Pad = (2);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c2Pad = (2);
    #define __c2 c2
    const AN5D_TYPE __halo1 = 2;
    const AN5D_TYPE __halo2 = 2;
    const AN5D_TYPE __side0Len = 3;
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
    float __reg_1_3;
    float __reg_1_4;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_2_3;
    float __reg_2_4;
    float __reg_3_0;
    float __reg_3_1;
    float __reg_3_2;
    float __reg_3_3;
    float __reg_3_4;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((0.03125f * (__SBREF(__a_sb, -2))) + (0.03126f * (__SBREF(__a_sb, -1)))) + (0.03127f * (__REGREF(__a, 0)))) + (0.03128f * (__SBREF(__a_sb, 1)))) + (0.03129f * (__SBREF(__a_sb, 2)))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((0.03130f * (__SBREF(__a_sb, -2)))) + (0.03131f * (__SBREF(__a_sb, -1)))) + (0.03132f * (__REGREF(__a, 0)))) + (0.03133f * (__SBREF(__a_sb, 1)))) + (0.03134f * (__SBREF(__a_sb, 2))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((0.03135f * (__SBREF(__a_sb, -2)))) + (0.03136f * (__SBREF(__a_sb, -1)))) + (0.24712f * (__REGREF(__a, 0)))) + (0.03138f * (__SBREF(__a_sb, 1)))) + (0.03139f * (__SBREF(__a_sb, 2)))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((0.03140f * (__SBREF(__a_sb, -2)))) + (0.03141f * (__SBREF(__a_sb, -1)))) + (0.03142f * (__REGREF(__a, 0)))) + (0.03143f * (__SBREF(__a_sb, 1)))) + (0.03144f * (__SBREF(__a_sb, 2))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((0.03145f * (__SBREF(__a_sb, -2)))) + (0.03146f * (__SBREF(__a_sb, -1)))) + (0.03147f * (__REGREF(__a, 0)))) + (0.03148f * (__SBREF(__a_sb, 1)))) + (0.03149f * (__SBREF(__a_sb, 2)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { float etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC2(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC3(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid3) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_0);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_0);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __STORE(2, __reg_3_2);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __STORE(3, __reg_3_3);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __STORE(4, __reg_3_4);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __STORE(5, __reg_3_0);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __STORE(6, __reg_3_1);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __LOAD(__reg_0, 9);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __LOAD(__reg_0, 10);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __LOAD(__reg_0, 11);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __LOAD(__reg_0, 12);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __STORE(6, __reg_3_1);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 13; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 6, __reg_3_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 6, __reg_3_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 6, __reg_3_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 6, __reg_3_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __reg_1_3 = __reg_0;
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 5, __reg_3_3);
        __reg_1_4 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 4, __reg_3_4);
        __reg_2_3 = __reg_1_3;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_1, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 3, __reg_3_0);
        __reg_2_4 = __reg_1_4;
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 2, __reg_3_1);
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_1, __reg_3_2, __reg_2_4);
        __STORE(__h - 1, __reg_3_2);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 5, __reg_3_3);
        __reg_1_4 = __reg_0;
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 4, __reg_3_4);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 3, __reg_3_0);
        __reg_2_4 = __reg_1_4;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_2, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 2, __reg_3_1);
        __reg_2_0 = __reg_1_0;
        __CALC3(__reg_3_1, __reg_3_1, __reg_3_1, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 1, __reg_3_2);
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_2, __reg_3_3, __reg_2_0);
        __STORE(__h + 0, __reg_3_3);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 5, __reg_3_3);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 4, __reg_3_4);
        __reg_1_0 = __reg_0;
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 3, __reg_3_0);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 2, __reg_3_1);
        __reg_2_0 = __reg_1_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_3, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 1, __reg_3_2);
        __reg_2_1 = __reg_1_1;
        __CALC3(__reg_3_2, __reg_3_2, __reg_3_2, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h + 0, __reg_3_3);
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_3, __reg_3_4, __reg_2_1);
        __STORE(__h + 1, __reg_3_4);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 5, __reg_3_3);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 4, __reg_3_4);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 3, __reg_3_0);
        __reg_1_1 = __reg_0;
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 2, __reg_3_1);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 1, __reg_3_2);
        __reg_2_1 = __reg_1_1;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_4, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h + 0, __reg_3_3);
        __reg_2_2 = __reg_1_2;
        __CALC3(__reg_3_3, __reg_3_3, __reg_3_3, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h + 1, __reg_3_4);
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_4, __reg_3_0, __reg_2_2);
        __STORE(__h + 2, __reg_3_0);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 5, __reg_3_3);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 4, __reg_3_4);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 3, __reg_3_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 2, __reg_3_1);
        __reg_1_2 = __reg_0;
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 1, __reg_3_2);
        __reg_1_3 = __reg_0;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h + 0, __reg_3_3);
        __reg_2_2 = __reg_1_2;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_0, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h + 1, __reg_3_4);
        __reg_2_3 = __reg_1_3;
        __CALC3(__reg_3_4, __reg_3_4, __reg_3_4, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h + 2, __reg_3_0);
        __CALC3(__reg_3_0, __reg_3_0, __reg_3_0, __reg_3_0, __reg_3_1, __reg_2_3);
        __STORE(__h + 3, __reg_3_1);
      }
    }
    else
    {
      for (__h = 13; __h <= __side1LenOl - 5;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
        __STORE(__h - 6, __reg_3_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
        __STORE(__h - 6, __reg_3_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
        __STORE(__h - 6, __reg_3_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
        __STORE(__h - 6, __reg_3_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
        __STORE(__h - 6, __reg_3_1);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __CALC3(__reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_2_4);
      __STORE(__h - 6, __reg_3_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __CALC3(__reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_3_3, __reg_2_0);
      __STORE(__h - 6, __reg_3_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __CALC3(__reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_3_4, __reg_2_1);
      __STORE(__h - 6, __reg_3_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __CALC3(__reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_3_0, __reg_2_2);
      __STORE(__h - 6, __reg_3_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __CALC3(__reg_3_0, __reg_3_4, __reg_3_3, __reg_3_2, __reg_3_1, __reg_2_3);
      __STORE(__h - 6, __reg_3_1);
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
    const AN5D_TYPE __c1Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c1Pad = (2);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c2Pad = (2);
    #define __c2 c2
    const AN5D_TYPE __halo1 = 2;
    const AN5D_TYPE __halo2 = 2;
    const AN5D_TYPE __side0Len = 2;
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
    float __reg_1_3;
    float __reg_1_4;
    float __reg_2_0;
    float __reg_2_1;
    float __reg_2_2;
    float __reg_2_3;
    float __reg_2_4;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((0.03125f * (__SBREF(__a_sb, -2))) + (0.03126f * (__SBREF(__a_sb, -1)))) + (0.03127f * (__REGREF(__a, 0)))) + (0.03128f * (__SBREF(__a_sb, 1)))) + (0.03129f * (__SBREF(__a_sb, 2)))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((0.03130f * (__SBREF(__a_sb, -2)))) + (0.03131f * (__SBREF(__a_sb, -1)))) + (0.03132f * (__REGREF(__a, 0)))) + (0.03133f * (__SBREF(__a_sb, 1)))) + (0.03134f * (__SBREF(__a_sb, 2))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((0.03135f * (__SBREF(__a_sb, -2)))) + (0.03136f * (__SBREF(__a_sb, -1)))) + (0.24712f * (__REGREF(__a, 0)))) + (0.03138f * (__SBREF(__a_sb, 1)))) + (0.03139f * (__SBREF(__a_sb, 2)))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((0.03140f * (__SBREF(__a_sb, -2)))) + (0.03141f * (__SBREF(__a_sb, -1)))) + (0.03142f * (__REGREF(__a, 0)))) + (0.03143f * (__SBREF(__a_sb, 1)))) + (0.03144f * (__SBREF(__a_sb, 2))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((0.03145f * (__SBREF(__a_sb, -2)))) + (0.03146f * (__SBREF(__a_sb, -1)))) + (0.03147f * (__REGREF(__a, 0)))) + (0.03148f * (__SBREF(__a_sb, 1)))) + (0.03149f * (__SBREF(__a_sb, 2)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { float etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __CALC2(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid2) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __STORE(2, __reg_2_2);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __STORE(3, __reg_2_3);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __STORE(4, __reg_2_4);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __LOAD(__reg_0, 7);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __LOAD(__reg_0, 8);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __STORE(4, __reg_2_4);
    }
    __a_sb = __a_sb_double + __blockSize * 0;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 9; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 4, __reg_2_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 4, __reg_2_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 4, __reg_2_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __STORE(__h - 4, __reg_2_4);
        __h++;
      }
      if (0) {}
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __reg_1_4 = __reg_0;
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 3, __reg_2_1);
        __reg_1_0 = __reg_0;
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 2, __reg_2_2);
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_2, __reg_2_3, __reg_1_0);
        __STORE(__h - 1, __reg_2_3);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 3, __reg_2_1);
        __reg_1_0 = __reg_0;
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 2, __reg_2_2);
        __reg_1_1 = __reg_0;
        __CALC2(__reg_2_2, __reg_2_2, __reg_2_2, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 1, __reg_2_3);
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_3, __reg_2_4, __reg_1_1);
        __STORE(__h + 0, __reg_2_4);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 3, __reg_2_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 2, __reg_2_2);
        __reg_1_1 = __reg_0;
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 1, __reg_2_3);
        __reg_1_2 = __reg_0;
        __CALC2(__reg_2_3, __reg_2_3, __reg_2_3, __reg_2_0, __reg_2_4, __reg_1_1);
        __STORE(__h + 0, __reg_2_4);
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_4, __reg_2_0, __reg_1_2);
        __STORE(__h + 1, __reg_2_0);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 3, __reg_2_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 2, __reg_2_2);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 1, __reg_2_3);
        __reg_1_2 = __reg_0;
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __STORE(__h + 0, __reg_2_4);
        __reg_1_3 = __reg_0;
        __CALC2(__reg_2_4, __reg_2_4, __reg_2_4, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h + 1, __reg_2_0);
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_0, __reg_2_1, __reg_1_3);
        __STORE(__h + 2, __reg_2_1);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 3, __reg_2_1);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 2, __reg_2_2);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 1, __reg_2_3);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __STORE(__h + 0, __reg_2_4);
        __reg_1_3 = __reg_0;
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h + 1, __reg_2_0);
        __reg_1_4 = __reg_0;
        __CALC2(__reg_2_0, __reg_2_0, __reg_2_0, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h + 2, __reg_2_1);
        __CALC2(__reg_2_1, __reg_2_1, __reg_2_1, __reg_2_1, __reg_2_2, __reg_1_4);
        __STORE(__h + 3, __reg_2_2);
      }
    }
    else
    {
      for (__h = 9; __h <= __side1LenOl - 5;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
        __STORE(__h - 4, __reg_2_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
        __STORE(__h - 4, __reg_2_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
        __STORE(__h - 4, __reg_2_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
        __STORE(__h - 4, __reg_2_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
        __STORE(__h - 4, __reg_2_4);
        __h++;
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __CALC2(__reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_1_2);
      __STORE(__h - 4, __reg_2_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __CALC2(__reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_2_1, __reg_1_3);
      __STORE(__h - 4, __reg_2_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __CALC2(__reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_2_2, __reg_1_4);
      __STORE(__h - 4, __reg_2_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __CALC2(__reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_2_3, __reg_1_0);
      __STORE(__h - 4, __reg_2_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __CALC2(__reg_2_3, __reg_2_2, __reg_2_1, __reg_2_0, __reg_2_4, __reg_1_1);
      __STORE(__h - 4, __reg_2_4);
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
    const AN5D_TYPE __c1Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c1Pad = (2);
    #define __c1 c1
    const AN5D_TYPE __c2Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c2Pad = (2);
    #define __c2 c2
    const AN5D_TYPE __halo1 = 2;
    const AN5D_TYPE __halo2 = 2;
    const AN5D_TYPE __side0Len = 1;
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
    float __reg_1_3;
    float __reg_1_4;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((0.03125f * (__SBREF(__a_sb, -2))) + (0.03126f * (__SBREF(__a_sb, -1)))) + (0.03127f * (__REGREF(__a, 0)))) + (0.03128f * (__SBREF(__a_sb, 1)))) + (0.03129f * (__SBREF(__a_sb, 2)))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((0.03130f * (__SBREF(__a_sb, -2)))) + (0.03131f * (__SBREF(__a_sb, -1)))) + (0.03132f * (__REGREF(__a, 0)))) + (0.03133f * (__SBREF(__a_sb, 1)))) + (0.03134f * (__SBREF(__a_sb, 2))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((0.03135f * (__SBREF(__a_sb, -2)))) + (0.03136f * (__SBREF(__a_sb, -1)))) + (0.24712f * (__REGREF(__a, 0)))) + (0.03138f * (__SBREF(__a_sb, 1)))) + (0.03139f * (__SBREF(__a_sb, 2)))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = (((((((((((0.03140f * (__SBREF(__a_sb, -2)))) + (0.03141f * (__SBREF(__a_sb, -1)))) + (0.03142f * (__REGREF(__a, 0)))) + (0.03143f * (__SBREF(__a_sb, 1)))) + (0.03144f * (__SBREF(__a_sb, 2))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[(((c0 + 1) % 2) * dimsize + c1) * dimsize + c2])
    #define __REGREF(reg, i2) reg
    #define __SBREF(sb, i2) __sbref_wrap(sb, (int)__tid + i2)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((0.03145f * (__SBREF(__a_sb, -2)))) + (0.03146f * (__SBREF(__a_sb, -1)))) + (0.03147f * (__REGREF(__a, 0)))) + (0.03148f * (__SBREF(__a_sb, 1)))) + (0.03149f * (__SBREF(__a_sb, 2)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { float etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, reg); } else out2 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __STORE(2, __reg_1_2);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __STORE(2, __reg_1_2);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 5; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 2, __reg_1_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 2, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 2, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 2, __reg_1_2);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 2 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __STORE(__h - 1, __reg_1_4);
      }
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 1, __reg_1_4);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 1, __reg_1_4);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 1, __reg_1_4);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 1, __reg_1_4);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
      }
    }
    else
    {
      for (__h = 5; __h <= __side1LenOl - 5;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 2, __reg_1_3);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
        __STORE(__h - 2, __reg_1_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 2, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 2, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 2, __reg_1_2);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_0);
      __STORE(__h - 2, __reg_1_3);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_4, __reg_0);
      __STORE(__h - 2, __reg_1_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __STORE(__h - 2, __reg_1_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(__h - 2, __reg_1_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __STORE(__h - 2, __reg_1_2);
      __h++;
    }
}
