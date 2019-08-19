#!/bin/bash

for i in j2d5pt j2d9pt-gol j2d9pt gradient2d star3d1r star3d2r j3d27pt; do
    if [[ $i =~ "2d" ]]; then
        size="16384"
    elif [[ $i =~ "3d" ]]; then
        size="512"
    fi
    
    echo ===== BUILD =====
    for regnum in 0 32 64; do
        ./make_sconf.sh ${i}.c $regnum;
    done
    echo ===== EXECUTION =====
    for bin in bin_an5d/${i}.float.* bin_an5d/${i}.double.*; do
        echo @@@ $bin @@@
        ./$bin -s $size -t 1000 -n 5
    done
done
