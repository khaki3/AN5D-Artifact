#!/bin/bash

mkdir -p bin/

NVCC_FLAGS="-gencode=arch=compute_60,code=sm_60"
NVCC_FLAGS="$NVCC_FLAGS -gencode=arch=compute_70,code=sm_70"
NVCC_FLAGS="$NVCC_FLAGS --use_fast_math -Xptxas -v -Xcompiler -fopenmp -O3"

COMPILE ()
{
    local input an5d_option regnum nvcc_option

    input=$1
    regnum=$2

    if [[ $input =~ "2d" ]]; then
        an5d_option="--bs1=128"
    elif [[ $input =~ "3d" ]]; then
        an5d_option="--bs1=32 --bs2=32"
    fi

    if [[ $input =~ [34]r ]]; then
        an5d_option="--bt=2 $an5d_option"
    else
        an5d_option="--bt=4 $an5d_option"
    fi

    for sb_type in "float" "double"; do
        if [ $regnum -gt 0 ]; then
            outpath="$(pwd)/bin/${input%.*}.${sb_type}.reg${regnum}"
            nvcc_option="--maxrregcount=${regnum} ${NVCC_FLAGS}"
        else
            outpath="$(pwd)/bin/${input%.*}.$sb_type"
            nvcc_option="${NVCC_FLAGS}"
        fi

        if [ -f $outpath           ] &&
           [ $outpath -nt common.h ] &&
           [ $outpath -nt make.sh  ] &&
           [ $outpath -nt $input   ]; then
            continue
        fi

        echo $outpath

        mkdir -p tmp
        cp common.h tmp
        cp $input tmp/src.c
        cd tmp
        an5d -D SB_TYPE=$sb_type $an5d_option src.c
        nvcc -D SB_TYPE=$sb_type $nvcc_option src_*.cu 2>/dev/null
        cp a.out $outpath
        cd ..
        rm -rf tmp
    done
}

cd $(dirname "$0")

if [[ "$#" != "1" && "$#" != "2" ]] ||
   [[ ! -f $(basename $1)        ]] ||
   [[ "$#" == "2" && ! $2 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 KERNEL_FILE [REGNUM]" >&2
    exit -1
fi

if [ "$#" == "1" ]; then
    COMPILE $(basename $1) 0
else
    COMPILE $(basename $1) $2
fi
