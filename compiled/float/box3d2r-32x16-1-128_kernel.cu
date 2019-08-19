#include "box3d2r-32x16-1-128_kernel.hu"
__device__ float __sbref_wrap(float *sb, size_t index) { return sb[index]; }

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
    const AN5D_TYPE __c3Len = (dimsize - 2 - 2);
    const AN5D_TYPE __c3Pad = (2);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 2;
    const AN5D_TYPE __halo2 = 2;
    const AN5D_TYPE __halo3 = 2;
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 12;
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
    float __reg_0;
    float __reg_1_0;
    float __reg_1_1;
    float __reg_1_2;
    float __reg_1_3;
    float __reg_1_4;
    __shared__ float __a_sb_double[__blockSize * 2];
    float *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-0.324f) * (__REGREF(__a, 0, 0))) + (0.0020f * (__SBREF(__a_sb, -2, -2)))) + (0.0030f * (__SBREF(__a_sb, -2, -1)))) + (0.0040f * (__SBREF(__a_sb, -2, 0)))) + (0.0050f * (__SBREF(__a_sb, -2, 1)))) + (0.0060f * (__SBREF(__a_sb, -2, 2)))) + (0.0070f * (__SBREF(__a_sb, -1, -2)))) + (0.0080f * (__SBREF(__a_sb, -1, -1)))) + (0.0090f * (__SBREF(__a_sb, -1, 0)))) + (0.0100f * (__SBREF(__a_sb, -1, 1)))) + (0.0110f * (__SBREF(__a_sb, -1, 2)))) + (0.0120f * (__SBREF(__a_sb, 0, -2)))) + (0.0130f * (__SBREF(__a_sb, 0, -1)))) + (0.0140f * (__SBREF(__a_sb, 0, 1)))) + (0.0150f * (__SBREF(__a_sb, 0, 2)))) + (0.0160f * (__SBREF(__a_sb, 1, -2)))) + (0.0170f * (__SBREF(__a_sb, 1, -1)))) + (0.0180f * (__SBREF(__a_sb, 1, 0)))) + (0.0190f * (__SBREF(__a_sb, 1, 1)))) + (0.0200f * (__SBREF(__a_sb, 1, 2)))) + (0.0210f * (__SBREF(__a_sb, 2, -2)))) + (0.0220f * (__SBREF(__a_sb, 2, -1)))) + (0.0230f * (__SBREF(__a_sb, 2, 0)))) + (0.0240f * (__SBREF(__a_sb, 2, 1)))) + (0.0250f * (__SBREF(__a_sb, 2, 2)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-(0.3264f * (__REGREF(__a, 0, 0)))) + (0.0021f * (__SBREF(__a_sb, -2, -2)))) + (0.0031f * (__SBREF(__a_sb, -2, -1)))) + (0.0041f * (__SBREF(__a_sb, -2, 0)))) + (0.0051f * (__SBREF(__a_sb, -2, 1)))) + (0.0061f * (__SBREF(__a_sb, -2, 2)))) + (0.0071f * (__SBREF(__a_sb, -1, -2)))) + (0.0081f * (__SBREF(__a_sb, -1, -1)))) + (0.0091f * (__SBREF(__a_sb, -1, 0)))) + (0.0101f * (__SBREF(__a_sb, -1, 1)))) + (0.0111f * (__SBREF(__a_sb, -1, 2)))) + (0.0121f * (__SBREF(__a_sb, 0, -2)))) + (0.0131f * (__SBREF(__a_sb, 0, -1)))) + (0.0141f * (__SBREF(__a_sb, 0, 1)))) + (0.0151f * (__SBREF(__a_sb, 0, 2)))) + (0.0161f * (__SBREF(__a_sb, 1, -2)))) + (0.0171f * (__SBREF(__a_sb, 1, -1)))) + (0.0181f * (__SBREF(__a_sb, 1, 0)))) + (0.0191f * (__SBREF(__a_sb, 1, 1)))) + (0.0201f * (__SBREF(__a_sb, 1, 2)))) + (0.0211f * (__SBREF(__a_sb, 2, -2)))) + (0.0221f * (__SBREF(__a_sb, 2, -1)))) + (0.0231f * (__SBREF(__a_sb, 2, 0)))) + (0.0241f * (__SBREF(__a_sb, 2, 1)))) + (0.0251f * (__SBREF(__a_sb, 2, 2))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { float etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.6712f * (__REGREF(__a, 0, 0)))) + (0.0022f * (__SBREF(__a_sb, -2, -2)))) + (0.0032f * (__SBREF(__a_sb, -2, -1)))) + (0.0042f * (__SBREF(__a_sb, -2, 0)))) + (0.0052f * (__SBREF(__a_sb, -2, 1)))) + (0.0062f * (__SBREF(__a_sb, -2, 2)))) + (0.0072f * (__SBREF(__a_sb, -1, -2)))) + (0.0082f * (__SBREF(__a_sb, -1, -1)))) + (0.0092f * (__SBREF(__a_sb, -1, 0)))) + (0.0102f * (__SBREF(__a_sb, -1, 1)))) + (0.0112f * (__SBREF(__a_sb, -1, 2)))) + (0.0122f * (__SBREF(__a_sb, 0, -2)))) + (0.0132f * (__SBREF(__a_sb, 0, -1)))) + (0.0142f * (__SBREF(__a_sb, 0, 1)))) + (0.0152f * (__SBREF(__a_sb, 0, 2)))) + (0.0162f * (__SBREF(__a_sb, 1, -2)))) + (0.0172f * (__SBREF(__a_sb, 1, -1)))) + (0.0182f * (__SBREF(__a_sb, 1, 0)))) + (0.0192f * (__SBREF(__a_sb, 1, 1)))) + (0.0202f * (__SBREF(__a_sb, 1, 2)))) + (0.0212f * (__SBREF(__a_sb, 2, -2)))) + (0.0222f * (__SBREF(__a_sb, 2, -1)))) + (0.0232f * (__SBREF(__a_sb, 2, 0)))) + (0.0242f * (__SBREF(__a_sb, 2, 1)))) + (0.0252f * (__SBREF(__a_sb, 2, 2)))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { float etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((-(0.3312f * (__REGREF(__a, 0, 0)))) + (0.0023f * (__SBREF(__a_sb, -2, -2)))) + (0.0033f * (__SBREF(__a_sb, -2, -1)))) + (0.0043f * (__SBREF(__a_sb, -2, 0)))) + (0.0053f * (__SBREF(__a_sb, -2, 1)))) + (0.0063f * (__SBREF(__a_sb, -2, 2)))) + (0.0073f * (__SBREF(__a_sb, -1, -2)))) + (0.0083f * (__SBREF(__a_sb, -1, -1)))) + (0.0093f * (__SBREF(__a_sb, -1, 0)))) + (0.0103f * (__SBREF(__a_sb, -1, 1)))) + (0.0113f * (__SBREF(__a_sb, -1, 2)))) + (0.0123f * (__SBREF(__a_sb, 0, -2)))) + (0.0133f * (__SBREF(__a_sb, 0, -1)))) + (0.0143f * (__SBREF(__a_sb, 0, 1)))) + (0.0153f * (__SBREF(__a_sb, 0, 2)))) + (0.0163f * (__SBREF(__a_sb, 1, -2)))) + (0.0173f * (__SBREF(__a_sb, 1, -1)))) + (0.0183f * (__SBREF(__a_sb, 1, 0)))) + (0.0193f * (__SBREF(__a_sb, 1, 1)))) + (0.0203f * (__SBREF(__a_sb, 1, 2)))) + (0.0213f * (__SBREF(__a_sb, 2, -2)))) + (0.0223f * (__SBREF(__a_sb, 2, -1)))) + (0.0233f * (__SBREF(__a_sb, 2, 0)))) + (0.0243f * (__SBREF(__a_sb, 2, 1)))) + (0.0253f * (__SBREF(__a_sb, 2, 2))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { float etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((-(0.3336f * (__REGREF(__a, 0, 0)))) + (0.0024f * (__SBREF(__a_sb, -2, -2)))) + (0.0034f * (__SBREF(__a_sb, -2, -1)))) + (0.0044f * (__SBREF(__a_sb, -2, 0)))) + (0.0054f * (__SBREF(__a_sb, -2, 1)))) + (0.0064f * (__SBREF(__a_sb, -2, 2)))) + (0.0074f * (__SBREF(__a_sb, -1, -2)))) + (0.0084f * (__SBREF(__a_sb, -1, -1)))) + (0.0094f * (__SBREF(__a_sb, -1, 0)))) + (0.0104f * (__SBREF(__a_sb, -1, 1)))) + (0.0114f * (__SBREF(__a_sb, -1, 2)))) + (0.0124f * (__SBREF(__a_sb, 0, -2)))) + (0.0134f * (__SBREF(__a_sb, 0, -1)))) + (0.0144f * (__SBREF(__a_sb, 0, 1)))) + (0.0154f * (__SBREF(__a_sb, 0, 2)))) + (0.0164f * (__SBREF(__a_sb, 1, -2)))) + (0.0174f * (__SBREF(__a_sb, 1, -1)))) + (0.0184f * (__SBREF(__a_sb, 1, 0)))) + (0.0194f * (__SBREF(__a_sb, 1, 1)))) + (0.0204f * (__SBREF(__a_sb, 1, 2)))) + (0.0214f * (__SBREF(__a_sb, 2, -2)))) + (0.0224f * (__SBREF(__a_sb, 2, -1)))) + (0.0234f * (__SBREF(__a_sb, 2, 0)))) + (0.0244f * (__SBREF(__a_sb, 2, 1)))) + (0.0254f * (__SBREF(__a_sb, 2, 2)))); } while (0)
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
