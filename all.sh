#!/bin/bash

GPUNAME=$(nvidia-smi -L | grep -oP '[PV]100' | head -n1 | tr '[PV]' '[pv]')

if [[ -z $GPUNAME ]]
then
	echo "Could not find Tesla P100 or V100"
	exit 1
fi

cd compiled

for regnum in 0 32 64 96; do
    ./nvcc_compile_top5.sh $(nproc) $regnum
    ./run.sh $GPUNAME
    cat $GPUNAME/float_run.csv >> ../tuned.float.log
    cat $GPUNAME/double_run.csv >> ../tuned.double.log
done

cd ..

./run_sconf.sh > sconf.log
