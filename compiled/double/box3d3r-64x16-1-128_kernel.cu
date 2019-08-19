#include "box3d3r-64x16-1-128_kernel.hu"
__device__ double __sbref_wrap(double *sb, size_t index) { return sb[index]; }

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
    const AN5D_TYPE __c3Len = (dimsize - 3 - 3);
    const AN5D_TYPE __c3Pad = (3);
    #define __c3 c3
    const AN5D_TYPE __halo1 = 3;
    const AN5D_TYPE __halo2 = 3;
    const AN5D_TYPE __halo3 = 3;
    const AN5D_TYPE __side0Len = 1;
    const AN5D_TYPE __side1Len = 128;
    const AN5D_TYPE __side2Len = 10;
    const AN5D_TYPE __side3Len = 58;
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
    double __reg_0;
    double __reg_1_0;
    double __reg_1_1;
    double __reg_1_2;
    double __reg_1_3;
    double __reg_1_4;
    double __reg_1_5;
    double __reg_1_6;
    __shared__ double __a_sb_double[__blockSize * 2];
    double *__a_sb = __a_sb_double;
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
    #define __CALCEXPR_0_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-0.176f) * (__REGREF(__a, 0, 0))) + (0.0010f * (__SBREF(__a_sb, -3, -3)))) + (0.0020f * (__SBREF(__a_sb, -3, -2)))) + (0.0030f * (__SBREF(__a_sb, -3, -1)))) + (0.0040f * (__SBREF(__a_sb, -3, 0)))) + (0.0050f * (__SBREF(__a_sb, -3, 1)))) + (0.0060f * (__SBREF(__a_sb, -3, 2)))) + (0.0070f * (__SBREF(__a_sb, -3, 3)))) + (0.0080f * (__SBREF(__a_sb, -2, -3)))) + (0.0090f * (__SBREF(__a_sb, -2, -2)))) + (0.0100f * (__SBREF(__a_sb, -2, -1)))) + (0.0110f * (__SBREF(__a_sb, -2, 0)))) + (0.0120f * (__SBREF(__a_sb, -2, 1)))) + (0.0130f * (__SBREF(__a_sb, -2, 2)))) + (0.0140f * (__SBREF(__a_sb, -2, 3)))) + (0.0150f * (__SBREF(__a_sb, -1, -3)))) + (0.0160f * (__SBREF(__a_sb, -1, -2)))) + (0.0170f * (__SBREF(__a_sb, -1, -1)))) + (0.0180f * (__SBREF(__a_sb, -1, 0)))) + (0.0190f * (__SBREF(__a_sb, -1, 1)))) + (0.0200f * (__SBREF(__a_sb, -1, 2)))) + (0.0210f * (__SBREF(__a_sb, -1, 3)))) + (0.0220f * (__SBREF(__a_sb, 0, -3)))) + (0.0230f * (__SBREF(__a_sb, 0, -2)))) + (0.0240f * (__SBREF(__a_sb, 0, -1)))) + (0.0250f * (__SBREF(__a_sb, 0, 1)))) + (0.0260f * (__SBREF(__a_sb, 0, 2)))) + (0.0270f * (__SBREF(__a_sb, 0, 3)))) + (0.0280f * (__SBREF(__a_sb, 1, -3)))) + (0.0290f * (__SBREF(__a_sb, 1, -2)))) + (0.0300f * (__SBREF(__a_sb, 1, -1)))) + (0.0310f * (__SBREF(__a_sb, 1, 0)))) + (0.0320f * (__SBREF(__a_sb, 1, 1)))) + (0.0330f * (__SBREF(__a_sb, 1, 2)))) + (0.0340f * (__SBREF(__a_sb, 1, 3)))) + (0.0350f * (__SBREF(__a_sb, 2, -3)))) + (0.0360f * (__SBREF(__a_sb, 2, -2)))) + (0.0370f * (__SBREF(__a_sb, 2, -1)))) + (0.0380f * (__SBREF(__a_sb, 2, 0)))) + (0.0390f * (__SBREF(__a_sb, 2, 1)))) + (0.0400f * (__SBREF(__a_sb, 2, 2)))) + (0.0410f * (__SBREF(__a_sb, 2, 3)))) + (0.0420f * (__SBREF(__a_sb, 3, -3)))) + (0.0430f * (__SBREF(__a_sb, 3, -2)))) + (0.0440f * (__SBREF(__a_sb, 3, -1)))) + (0.0450f * (__SBREF(__a_sb, 3, 0)))) + (0.0460f * (__SBREF(__a_sb, 3, 1)))) + (0.0470f * (__SBREF(__a_sb, 3, 2)))) + (0.0480f * (__SBREF(__a_sb, 3, 3)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_0(out, a) do { __CALCEXPR_0_wrap(out, a);  } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_1_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.1808f * (__REGREF(__a, 0, 0)))) - (0.0011f * (__SBREF(__a_sb, -3, -3)))) - (0.0021f * (__SBREF(__a_sb, -3, -2)))) - (0.0031f * (__SBREF(__a_sb, -3, -1)))) - (0.0041f * (__SBREF(__a_sb, -3, 0)))) - (0.0051f * (__SBREF(__a_sb, -3, 1)))) - (0.0061f * (__SBREF(__a_sb, -3, 2)))) - (0.0071f * (__SBREF(__a_sb, -3, 3)))) - (0.0081f * (__SBREF(__a_sb, -2, -3)))) - (0.0091f * (__SBREF(__a_sb, -2, -2)))) - (0.0101f * (__SBREF(__a_sb, -2, -1)))) - (0.0111f * (__SBREF(__a_sb, -2, 0)))) - (0.0121f * (__SBREF(__a_sb, -2, 1)))) - (0.0131f * (__SBREF(__a_sb, -2, 2)))) - (0.0141f * (__SBREF(__a_sb, -2, 3)))) - (0.0151f * (__SBREF(__a_sb, -1, -3)))) - (0.0161f * (__SBREF(__a_sb, -1, -2)))) - (0.0171f * (__SBREF(__a_sb, -1, -1)))) - (0.0181f * (__SBREF(__a_sb, -1, 0)))) - (0.0191f * (__SBREF(__a_sb, -1, 1)))) - (0.0201f * (__SBREF(__a_sb, -1, 2)))) - (0.0211f * (__SBREF(__a_sb, -1, 3)))) - (0.0221f * (__SBREF(__a_sb, 0, -3)))) - (0.0231f * (__SBREF(__a_sb, 0, -2)))) - (0.0241f * (__SBREF(__a_sb, 0, -1)))) - (0.0251f * (__SBREF(__a_sb, 0, 1)))) - (0.0261f * (__SBREF(__a_sb, 0, 2)))) - (0.0271f * (__SBREF(__a_sb, 0, 3)))) - (0.0281f * (__SBREF(__a_sb, 1, -3)))) - (0.0291f * (__SBREF(__a_sb, 1, -2)))) - (0.0301f * (__SBREF(__a_sb, 1, -1)))) - (0.0311f * (__SBREF(__a_sb, 1, 0)))) - (0.0321f * (__SBREF(__a_sb, 1, 1)))) - (0.0331f * (__SBREF(__a_sb, 1, 2)))) - (0.0341f * (__SBREF(__a_sb, 1, 3)))) - (0.0351f * (__SBREF(__a_sb, 2, -3)))) - (0.0361f * (__SBREF(__a_sb, 2, -2)))) - (0.0371f * (__SBREF(__a_sb, 2, -1)))) - (0.0381f * (__SBREF(__a_sb, 2, 0)))) - (0.0391f * (__SBREF(__a_sb, 2, 1)))) - (0.0401f * (__SBREF(__a_sb, 2, 2)))) - (0.0411f * (__SBREF(__a_sb, 2, 3)))) - (0.0421f * (__SBREF(__a_sb, 3, -3)))) - (0.0431f * (__SBREF(__a_sb, 3, -2)))) - (0.0441f * (__SBREF(__a_sb, 3, -1)))) - (0.0451f * (__SBREF(__a_sb, 3, 0)))) - (0.0461f * (__SBREF(__a_sb, 3, 1)))) - (0.0471f * (__SBREF(__a_sb, 3, 2)))) - (0.0481f * (__SBREF(__a_sb, 3, 3))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_1(out, a) do { double etmp; __CALCEXPR_1_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_2_wrap(__rn0, __a) do { __rn0 = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-0.1856f) * (__REGREF(__a, 0, 0)))) + (0.0012f * (__SBREF(__a_sb, -3, -3)))) + (0.0022f * (__SBREF(__a_sb, -3, -2)))) + (0.0032f * (__SBREF(__a_sb, -3, -1)))) + (0.0042f * (__SBREF(__a_sb, -3, 0)))) + (0.0052f * (__SBREF(__a_sb, -3, 1)))) + (0.0062f * (__SBREF(__a_sb, -3, 2)))) + (0.0072f * (__SBREF(__a_sb, -3, 3)))) + (0.0082f * (__SBREF(__a_sb, -2, -3)))) + (0.0092f * (__SBREF(__a_sb, -2, -2)))) + (0.0102f * (__SBREF(__a_sb, -2, -1)))) + (0.0112f * (__SBREF(__a_sb, -2, 0)))) + (0.0122f * (__SBREF(__a_sb, -2, 1)))) + (0.0132f * (__SBREF(__a_sb, -2, 2)))) + (0.0142f * (__SBREF(__a_sb, -2, 3)))) + (0.0152f * (__SBREF(__a_sb, -1, -3)))) + (0.0162f * (__SBREF(__a_sb, -1, -2)))) + (0.0172f * (__SBREF(__a_sb, -1, -1)))) + (0.0182f * (__SBREF(__a_sb, -1, 0)))) + (0.0192f * (__SBREF(__a_sb, -1, 1)))) + (0.0202f * (__SBREF(__a_sb, -1, 2)))) + (0.0212f * (__SBREF(__a_sb, -1, 3)))) + (0.0222f * (__SBREF(__a_sb, 0, -3)))) + (0.0232f * (__SBREF(__a_sb, 0, -2)))) + (0.0242f * (__SBREF(__a_sb, 0, -1)))) + (0.0252f * (__SBREF(__a_sb, 0, 1)))) + (0.0262f * (__SBREF(__a_sb, 0, 2)))) + (0.0272f * (__SBREF(__a_sb, 0, 3)))) + (0.0282f * (__SBREF(__a_sb, 1, -3)))) + (0.0292f * (__SBREF(__a_sb, 1, -2)))) + (0.0302f * (__SBREF(__a_sb, 1, -1)))) + (0.0312f * (__SBREF(__a_sb, 1, 0)))) + (0.0322f * (__SBREF(__a_sb, 1, 1)))) + (0.0332f * (__SBREF(__a_sb, 1, 2)))) + (0.0342f * (__SBREF(__a_sb, 1, 3)))) + (0.0352f * (__SBREF(__a_sb, 2, -3)))) + (0.0362f * (__SBREF(__a_sb, 2, -2)))) + (0.0372f * (__SBREF(__a_sb, 2, -1)))) + (0.0382f * (__SBREF(__a_sb, 2, 0)))) + (0.0392f * (__SBREF(__a_sb, 2, 1)))) + (0.0402f * (__SBREF(__a_sb, 2, 2)))) + (0.0412f * (__SBREF(__a_sb, 2, 3)))) + (0.0422f * (__SBREF(__a_sb, 3, -3)))) + (0.0432f * (__SBREF(__a_sb, 3, -2)))) + (0.0442f * (__SBREF(__a_sb, 3, -1)))) + (0.0452f * (__SBREF(__a_sb, 3, 0)))) + (0.0462f * (__SBREF(__a_sb, 3, 1)))) + (0.0472f * (__SBREF(__a_sb, 3, 2)))) + (0.0482f * (__SBREF(__a_sb, 3, 3)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_2(out, a) do { double etmp; __CALCEXPR_2_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_3_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-0.1904f) * (__REGREF(__a, 0, 0)))) + (0.0013f * (__SBREF(__a_sb, -3, -3)))) + (0.0023f * (__SBREF(__a_sb, -3, -2)))) + (0.0033f * (__SBREF(__a_sb, -3, -1)))) + (0.0043f * (__SBREF(__a_sb, -3, 0)))) + (0.0053f * (__SBREF(__a_sb, -3, 1)))) + (0.0063f * (__SBREF(__a_sb, -3, 2)))) + (0.0073f * (__SBREF(__a_sb, -3, 3)))) + (0.0083f * (__SBREF(__a_sb, -2, -3)))) + (0.0093f * (__SBREF(__a_sb, -2, -2)))) + (0.0103f * (__SBREF(__a_sb, -2, -1)))) + (0.0113f * (__SBREF(__a_sb, -2, 0)))) + (0.0123f * (__SBREF(__a_sb, -2, 1)))) + (0.0133f * (__SBREF(__a_sb, -2, 2)))) + (0.0143f * (__SBREF(__a_sb, -2, 3)))) + (0.0153f * (__SBREF(__a_sb, -1, -3)))) + (0.0163f * (__SBREF(__a_sb, -1, -2)))) + (0.0173f * (__SBREF(__a_sb, -1, -1)))) + (0.0183f * (__SBREF(__a_sb, -1, 0)))) + (0.0193f * (__SBREF(__a_sb, -1, 1)))) + (0.0203f * (__SBREF(__a_sb, -1, 2)))) + (0.0213f * (__SBREF(__a_sb, -1, 3)))) + (0.0223f * (__SBREF(__a_sb, 0, -3)))) + (0.0233f * (__SBREF(__a_sb, 0, -2)))) + (0.0243f * (__SBREF(__a_sb, 0, -1)))) + (0.0253f * (__SBREF(__a_sb, 0, 1)))) + (0.0263f * (__SBREF(__a_sb, 0, 2)))) + (0.0273f * (__SBREF(__a_sb, 0, 3)))) + (0.0283f * (__SBREF(__a_sb, 1, -3)))) + (0.0293f * (__SBREF(__a_sb, 1, -2)))) + (0.0303f * (__SBREF(__a_sb, 1, -1)))) + (0.0313f * (__SBREF(__a_sb, 1, 0)))) + (0.0323f * (__SBREF(__a_sb, 1, 1)))) + (0.0333f * (__SBREF(__a_sb, 1, 2)))) + (0.0343f * (__SBREF(__a_sb, 1, 3)))) + (0.0353f * (__SBREF(__a_sb, 2, -3)))) + (0.0363f * (__SBREF(__a_sb, 2, -2)))) + (0.0373f * (__SBREF(__a_sb, 2, -1)))) + (0.0383f * (__SBREF(__a_sb, 2, 0)))) + (0.0393f * (__SBREF(__a_sb, 2, 1)))) + (0.0403f * (__SBREF(__a_sb, 2, 2)))) + (0.0413f * (__SBREF(__a_sb, 2, 3)))) + (0.0423f * (__SBREF(__a_sb, 3, -3)))) + (0.0433f * (__SBREF(__a_sb, 3, -2)))) + (0.0443f * (__SBREF(__a_sb, 3, -1)))) + (0.0453f * (__SBREF(__a_sb, 3, 0)))) + (0.0463f * (__SBREF(__a_sb, 3, 1)))) + (0.0473f * (__SBREF(__a_sb, 3, 2)))) + (0.0483f * (__SBREF(__a_sb, 3, 3))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_3(out, a) do { double etmp; __CALCEXPR_3_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_4_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((0.1952f * (__REGREF(__a, 0, 0)))) - (0.0014f * (__SBREF(__a_sb, -3, -3)))) - (0.0024f * (__SBREF(__a_sb, -3, -2)))) - (0.0034f * (__SBREF(__a_sb, -3, -1)))) - (0.0044f * (__SBREF(__a_sb, -3, 0)))) - (0.0054f * (__SBREF(__a_sb, -3, 1)))) - (0.0064f * (__SBREF(__a_sb, -3, 2)))) - (0.0074f * (__SBREF(__a_sb, -3, 3)))) - (0.0084f * (__SBREF(__a_sb, -2, -3)))) - (0.0094f * (__SBREF(__a_sb, -2, -2)))) - (0.0104f * (__SBREF(__a_sb, -2, -1)))) - (0.0114f * (__SBREF(__a_sb, -2, 0)))) - (0.0124f * (__SBREF(__a_sb, -2, 1)))) - (0.0134f * (__SBREF(__a_sb, -2, 2)))) - (0.0144f * (__SBREF(__a_sb, -2, 3)))) - (0.0154f * (__SBREF(__a_sb, -1, -3)))) - (0.0164f * (__SBREF(__a_sb, -1, -2)))) - (0.0174f * (__SBREF(__a_sb, -1, -1)))) - (0.0184f * (__SBREF(__a_sb, -1, 0)))) - (0.0194f * (__SBREF(__a_sb, -1, 1)))) - (0.0204f * (__SBREF(__a_sb, -1, 2)))) - (0.0214f * (__SBREF(__a_sb, -1, 3)))) - (0.0224f * (__SBREF(__a_sb, 0, -3)))) - (0.0234f * (__SBREF(__a_sb, 0, -2)))) - (0.0244f * (__SBREF(__a_sb, 0, -1)))) - (0.0254f * (__SBREF(__a_sb, 0, 1)))) - (0.0264f * (__SBREF(__a_sb, 0, 2)))) - (0.0274f * (__SBREF(__a_sb, 0, 3)))) - (0.0284f * (__SBREF(__a_sb, 1, -3)))) - (0.0294f * (__SBREF(__a_sb, 1, -2)))) - (0.0304f * (__SBREF(__a_sb, 1, -1)))) - (0.0314f * (__SBREF(__a_sb, 1, 0)))) - (0.0324f * (__SBREF(__a_sb, 1, 1)))) - (0.0334f * (__SBREF(__a_sb, 1, 2)))) - (0.0344f * (__SBREF(__a_sb, 1, 3)))) - (0.0354f * (__SBREF(__a_sb, 2, -3)))) - (0.0364f * (__SBREF(__a_sb, 2, -2)))) - (0.0374f * (__SBREF(__a_sb, 2, -1)))) - (0.0384f * (__SBREF(__a_sb, 2, 0)))) - (0.0394f * (__SBREF(__a_sb, 2, 1)))) - (0.0404f * (__SBREF(__a_sb, 2, 2)))) - (0.0414f * (__SBREF(__a_sb, 2, 3)))) - (0.0424f * (__SBREF(__a_sb, 3, -3)))) - (0.0434f * (__SBREF(__a_sb, 3, -2)))) - (0.0444f * (__SBREF(__a_sb, 3, -1)))) - (0.0454f * (__SBREF(__a_sb, 3, 0)))) - (0.0464f * (__SBREF(__a_sb, 3, 1)))) - (0.0474f * (__SBREF(__a_sb, 3, 2)))) - (0.0484f * (__SBREF(__a_sb, 3, 3)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_4(out, a) do { double etmp; __CALCEXPR_4_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_5_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((-((-0.300f) * (__REGREF(__a, 0, 0)))) + (0.0015f * (__SBREF(__a_sb, -3, -3)))) + (0.0025f * (__SBREF(__a_sb, -3, -2)))) + (0.0035f * (__SBREF(__a_sb, -3, -1)))) + (0.0045f * (__SBREF(__a_sb, -3, 0)))) + (0.0055f * (__SBREF(__a_sb, -3, 1)))) + (0.0065f * (__SBREF(__a_sb, -3, 2)))) + (0.0075f * (__SBREF(__a_sb, -3, 3)))) + (0.0085f * (__SBREF(__a_sb, -2, -3)))) + (0.0095f * (__SBREF(__a_sb, -2, -2)))) + (0.0105f * (__SBREF(__a_sb, -2, -1)))) + (0.0115f * (__SBREF(__a_sb, -2, 0)))) + (0.0125f * (__SBREF(__a_sb, -2, 1)))) + (0.0135f * (__SBREF(__a_sb, -2, 2)))) + (0.0145f * (__SBREF(__a_sb, -2, 3)))) + (0.0155f * (__SBREF(__a_sb, -1, -3)))) + (0.0165f * (__SBREF(__a_sb, -1, -2)))) + (0.0175f * (__SBREF(__a_sb, -1, -1)))) + (0.0185f * (__SBREF(__a_sb, -1, 0)))) + (0.0195f * (__SBREF(__a_sb, -1, 1)))) + (0.0205f * (__SBREF(__a_sb, -1, 2)))) + (0.0215f * (__SBREF(__a_sb, -1, 3)))) + (0.0225f * (__SBREF(__a_sb, 0, -3)))) + (0.0235f * (__SBREF(__a_sb, 0, -2)))) + (0.0245f * (__SBREF(__a_sb, 0, -1)))) + (0.0255f * (__SBREF(__a_sb, 0, 1)))) + (0.0265f * (__SBREF(__a_sb, 0, 2)))) + (0.0275f * (__SBREF(__a_sb, 0, 3)))) + (0.0285f * (__SBREF(__a_sb, 1, -3)))) + (0.0295f * (__SBREF(__a_sb, 1, -2)))) + (0.0305f * (__SBREF(__a_sb, 1, -1)))) + (0.0315f * (__SBREF(__a_sb, 1, 0)))) + (0.0325f * (__SBREF(__a_sb, 1, 1)))) + (0.0335f * (__SBREF(__a_sb, 1, 2)))) + (0.0345f * (__SBREF(__a_sb, 1, 3)))) + (0.0355f * (__SBREF(__a_sb, 2, -3)))) + (0.0365f * (__SBREF(__a_sb, 2, -2)))) + (0.0375f * (__SBREF(__a_sb, 2, -1)))) + (0.0385f * (__SBREF(__a_sb, 2, 0)))) + (0.0395f * (__SBREF(__a_sb, 2, 1)))) + (0.0405f * (__SBREF(__a_sb, 2, 2)))) + (0.0415f * (__SBREF(__a_sb, 2, 3)))) + (0.0425f * (__SBREF(__a_sb, 3, -3)))) + (0.0435f * (__SBREF(__a_sb, 3, -2)))) + (0.0445f * (__SBREF(__a_sb, 3, -1)))) + (0.0455f * (__SBREF(__a_sb, 3, 0)))) + (0.0465f * (__SBREF(__a_sb, 3, 1)))) + (0.0475f * (__SBREF(__a_sb, 3, 2)))) + (0.1485f * (__SBREF(__a_sb, 3, 3))))))))))))))))))))))))))))))))))))))))))))))))))))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_5(out, a) do { double etmp; __CALCEXPR_5_wrap(etmp, a); out += etmp; } while (0);
    #define __DEST (A[((((c0 + 1) % 2) * dimsize + c1) * dimsize + c2) * dimsize + c3])
    #define __REGREF(reg, i2, i3) reg
    #define __SBREF(sb, i2, i3) __sbref_wrap(sb, (int)__tid + i2 * (int)__side3LenOl + i3)
    #define __CALCEXPR_6_wrap(__rn0, __a) do { __rn0 = ((((((((((((((((((((((((((((((((((((((((((((((((((0.2048f * (__REGREF(__a, 0, 0)))) - (0.0016f * (__SBREF(__a_sb, -3, -3)))) - (0.0026f * (__SBREF(__a_sb, -3, -2)))) - (0.0036f * (__SBREF(__a_sb, -3, -1)))) - (0.0046f * (__SBREF(__a_sb, -3, 0)))) - (0.0056f * (__SBREF(__a_sb, -3, 1)))) - (0.0066f * (__SBREF(__a_sb, -3, 2)))) - (0.0076f * (__SBREF(__a_sb, -3, 3)))) - (0.0086f * (__SBREF(__a_sb, -2, -3)))) - (0.0096f * (__SBREF(__a_sb, -2, -2)))) - (0.0106f * (__SBREF(__a_sb, -2, -1)))) - (0.0116f * (__SBREF(__a_sb, -2, 0)))) - (0.0126f * (__SBREF(__a_sb, -2, 1)))) - (0.0136f * (__SBREF(__a_sb, -2, 2)))) - (0.0146f * (__SBREF(__a_sb, -2, 3)))) - (0.0156f * (__SBREF(__a_sb, -1, -3)))) - (0.0166f * (__SBREF(__a_sb, -1, -2)))) - (0.0176f * (__SBREF(__a_sb, -1, -1)))) - (0.0186f * (__SBREF(__a_sb, -1, 0)))) - (0.0196f * (__SBREF(__a_sb, -1, 1)))) - (0.0206f * (__SBREF(__a_sb, -1, 2)))) - (0.0216f * (__SBREF(__a_sb, -1, 3)))) - (0.0226f * (__SBREF(__a_sb, 0, -3)))) - (0.0236f * (__SBREF(__a_sb, 0, -2)))) - (0.0246f * (__SBREF(__a_sb, 0, -1)))) - (0.0256f * (__SBREF(__a_sb, 0, 1)))) - (0.0266f * (__SBREF(__a_sb, 0, 2)))) - (0.0276f * (__SBREF(__a_sb, 0, 3)))) - (0.0286f * (__SBREF(__a_sb, 1, -3)))) - (0.0296f * (__SBREF(__a_sb, 1, -2)))) - (0.0306f * (__SBREF(__a_sb, 1, -1)))) - (0.0316f * (__SBREF(__a_sb, 1, 0)))) - (0.0326f * (__SBREF(__a_sb, 1, 1)))) - (0.0336f * (__SBREF(__a_sb, 1, 2)))) - (0.0346f * (__SBREF(__a_sb, 1, 3)))) - (0.0356f * (__SBREF(__a_sb, 2, -3)))) - (0.0366f * (__SBREF(__a_sb, 2, -2)))) - (0.0376f * (__SBREF(__a_sb, 2, -1)))) - (0.0386f * (__SBREF(__a_sb, 2, 0)))) - (0.0396f * (__SBREF(__a_sb, 2, 1)))) - (0.0406f * (__SBREF(__a_sb, 2, 2)))) - (0.0416f * (__SBREF(__a_sb, 2, 3)))) - (0.0426f * (__SBREF(__a_sb, 3, -3)))) - (0.0436f * (__SBREF(__a_sb, 3, -2)))) - (0.0446f * (__SBREF(__a_sb, 3, -1)))) - (0.0456f * (__SBREF(__a_sb, 3, 0)))) - (0.0466f * (__SBREF(__a_sb, 3, 1)))) - (0.0476f * (__SBREF(__a_sb, 3, 2)))) - (0.0486f * (__SBREF(__a_sb, 3, 3)))); } while (0)
    #define __DB_SWITCH() do { __a_sb = &__a_sb_double[(__a_sb == __a_sb_double) ? __blockSize : 0]; } while (0)
    #define __CALCSETUP(a) do { __DB_SWITCH(); __a_sb[__tid] = a; __syncthreads(); } while (0)
    #define __CALCEXPR_6(out, a) do { double etmp; __CALCEXPR_6_wrap(etmp, a); out += etmp; } while (0);
    #define __CALCEXPR(out0, out1, out2, out3, out4, out5, out6, reg) do { __CALCEXPR_0(out0, reg); __CALCEXPR_1(out1, reg); __CALCEXPR_2(out2, reg); __CALCEXPR_3(out3, reg); __CALCEXPR_4(out4, reg); __CALCEXPR_5(out5, reg); __CALCEXPR_6(out6, reg); } while (0);
    #define __CALC1(out0, out1, out2, out3, out4, out5, out6, reg) do { __CALCSETUP(reg); if (__writeValid1) { __CALCEXPR(out0, out1, out2, out3, out4, out5, out6, reg); } else out3 = reg; } while (0)
    #define __STORE(h, out) do { if (__storeValid) { __c1 = __c1Pad2 - __halo1 + h; __DEST = out; }} while (0)
    if (__c1Id == 0)
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __STORE(3, __reg_1_3);
    }
    else
    {
      __LOAD(__reg_0, 0);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __LOAD(__reg_0, 1);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
      __LOAD(__reg_0, 2);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
      __LOAD(__reg_0, 3);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __LOAD(__reg_0, 4);
      __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __LOAD(__reg_0, 5);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __LOAD(__reg_0, 6);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __STORE(3, __reg_1_3);
    }
    __a_sb = __a_sb_double + __blockSize * 1;
    if (__c1Id == __side1Num - 1)
    {
      for (__h = 7; __h <= __c1Len - __side1Len * __c1Id + __halo1 * 2 - 10;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 3, __reg_1_5);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 3, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 3, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 3, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 3, __reg_1_3);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (0) {}
      else if (__h + 3 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
      }
      else if (__h + 4 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
      }
      else if (__h + 5 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_5, __reg_1_5, __reg_1_5, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
      }
      else if (__h + 6 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_6, __reg_1_6, __reg_1_6, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
      }
      else if (__h + 7 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_0, __reg_1_0, __reg_1_0, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
      }
      else if (__h + 8 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_1, __reg_1_1, __reg_1_1, __reg_1_1, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
      }
      else if (__h + 9 == __c1Len - __side1Len * __c1Id + __halo1 * 2)
      {
        __LOAD(__reg_0, __h + 0);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __LOAD(__reg_0, __h + 1);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 2, __reg_1_5);
        __LOAD(__reg_0, __h + 2);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 1, __reg_1_6);
        __LOAD(__reg_0, __h + 3);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h + 0, __reg_1_0);
        __LOAD(__reg_0, __h + 4);
        __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h + 1, __reg_1_1);
        __LOAD(__reg_0, __h + 5);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h + 2, __reg_1_2);
        __LOAD(__reg_0, __h + 6);
        __CALC1(__reg_1_2, __reg_1_2, __reg_1_2, __reg_1_2, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h + 3, __reg_1_3);
        __LOAD(__reg_0, __h + 7);
        __CALC1(__reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_3, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h + 4, __reg_1_4);
        __LOAD(__reg_0, __h + 8);
        __CALC1(__reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_4, __reg_1_5, __reg_0);
        __STORE(__h + 5, __reg_1_5);
      }
    }
    else
    {
      for (__h = 7; __h <= __side1LenOl - 7;)
      {
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
        __STORE(__h - 3, __reg_1_4);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
        __STORE(__h - 3, __reg_1_5);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
        __STORE(__h - 3, __reg_1_6);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
        __STORE(__h - 3, __reg_1_0);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
        __STORE(__h - 3, __reg_1_1);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
        __STORE(__h - 3, __reg_1_2);
        __h++;
        __LOAD(__reg_0, __h);
        __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
        __STORE(__h - 3, __reg_1_3);
        __h++;
        __DB_SWITCH(); __syncthreads();
      }
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_0);
      __STORE(__h - 3, __reg_1_4);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_0);
      __STORE(__h - 3, __reg_1_5);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_0);
      __STORE(__h - 3, __reg_1_6);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_1_0, __reg_0);
      __STORE(__h - 3, __reg_1_0);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_1_1, __reg_0);
      __STORE(__h - 3, __reg_1_1);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_1_2, __reg_0);
      __STORE(__h - 3, __reg_1_2);
      __h++;
      if (__h == __side1LenOl) return;
      __LOAD(__reg_0, __h);
      __CALC1(__reg_1_2, __reg_1_1, __reg_1_0, __reg_1_6, __reg_1_5, __reg_1_4, __reg_1_3, __reg_0);
      __STORE(__h - 3, __reg_1_3);
      __h++;
    }
}
