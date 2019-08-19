#!/bin/bash

REGNUM ()
{
    local bin tbsize

    bin=$1
    tbsize=$2

    bin="$(dirname $bin)/$(basename $bin)"

    nvprof --csv --print-gpu-trace $bin -t $((tbsize * 2)) -s $((2 * tbsize * 5)) 2>&1 1>/dev/null |
    grep kernel | cut -d, -f 9 | sort | uniq
}

if [ "$#" != "2" ] || [ ! -f $1 ] || [[ ! $2 =~ ^[1-9][0-9]*$ ]]; then
    echo "Usage: $0 BIN TBSIZE" >&2
    exit -1
fi

REGNUM $1 $2
