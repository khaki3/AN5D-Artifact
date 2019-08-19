#!/bin/bash

mkdir -p bin_an5d/

NVCC_FLAGS="-gencode=arch=compute_60,code=sm_60"
NVCC_FLAGS="$NVCC_FLAGS -gencode=arch=compute_70,code=sm_70"
NVCC_FLAGS="$NVCC_FLAGS --use_fast_math -Xptxas -v -Xcompiler -fopenmp -O3"

COMPILE ()
{
    local input an5d_option regnum nvcc_option

    input=$1

    if [[ $input =~ "2d" ]]; then
        an5d_option="--bs1=128"
    elif [[ $input =~ "3d" ]]; then
        an5d_option="--bs1=32 --bs2=32 --sl=512"
    fi

    if [[ $input =~ "j2d9pt-gol" ]]; then
        an5d_option="--opt=none $an5d_option"
    fi

    for regnum in 32; do
    for t in 4; do
        for sb_type in "float"; do
            if [ $regnum -gt 0 ]; then
                outpath="$(pwd)/bin_an5d/${input%.*}.${sb_type}.${t}.reg${regnum}"
                regopt="--maxrregcount=${regnum}"
            else
                outpath="$(pwd)/bin_an5d/${input%.*}.$sb_type.${t}"
                regopt=""
            fi

            # if [ -f $outpath           ] &&
            #     [ $outpath -nt common.h ] &&
            #     [ $outpath -nt make.sh  ] &&
            #     [ $outpath -nt $input   ]; then
            #     continue
            # fi

            echo $outpath

            TMPDIR="$(mktemp -d)"
            cp common.h $TMPDIR
            cp $input $TMPDIR/src.c
            cd $TMPDIR
            an5d -D SB_TYPE=$sb_type $an5d_option --bt=$t src.c
            nvcc -D SB_TYPE=$sb_type ${NVCC_FLAGS} $regopt src_*.cu 2>&1 | egrep 'register|sm_|spill|ptxas'
            cd -
            # cp $TMPDIR/a.out $outpath
            rm -rf $TMPDIR
        done
    done
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
