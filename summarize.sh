#!/bin/bash

if [[ $(whoami)x != rootx ]]; then
    echo "Execution is allowed only in the docker container"
    exit 1;
fi

TUNED_FLOAT_LOG=../AN5D-Artifact/tuned.float.log
TUNED_DOUBLE_LOG=../AN5D-Artifact/tuned.double.log
SCONF_LOG=../AN5D-Artifact/sconf.log
HYBRID_LOG=../StencilBench/hybrid.log
LOOP_TILING_LOG=../StencilBench/loop_tiling.log
STENCILGEN_LOG=../IEEE2017/stencilgen.log

if [[ ! -f $TUNED_FLOAT_LOG ]] || [[ ! -f $TUNED_DOUBLE_LOG ]] ||
    [[ ! -f $SCONF_LOG ]] ; then
    git pull && ./all.sh
fi

if [[ ! -f $HYBRID_LOG ]] || [[ ! -f $LOOP_TILING_LOG ]] ; then
    cd ../StencilBench;
    git pull && ./all.sh;
    cd ../AN5D-Artifact;
fi

if [[ ! -f $STENCILGEN_LOG ]] ; then
    cd ../IEEE2017;
    git pull && ./all.sh;
    cd ../AN5D-Artifact;
fi

extract ()
{
    egrep '@@|Average' |
    sed 's/^@@@/@/; s/@@@//;' |
    tr -d '\n' |
    sed 's/@Average://g; s/\.\//@/g' |
    sed 's/@ *@/@/g' |
    tr '@' '\n' |
    sed 's/Average://'
    echo
}

echo "========================="
echo "====  AN5D TUNED (float)"
cat $TUNED_FLOAT_LOG | sort | grep -v Measure | cut -d, -f 1,7

echo "========================="
echo "====  AN5D TUNED (double)"
cat $TUNED_DOUBLE_LOG | sort | grep -v Measure | cut -d, -f 1,7

echo "========================="
echo "==== AN5D SCONF "
cat $SCONF_LOG | extract

echo "========================="
echo "==== HYBRID "
cat $HYBRID_LOG | extract

echo "========================="
echo "==== LOOP_TILING "
cat $LOOP_TILING_LOG | extract

echo "========================="
echo "==== STENCILGEN "
cat stencilgen.log  | egrep 'Computation|_run.sh'
