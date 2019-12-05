#!/bin/bash

if [[ -z $1 ]]
then
	echo "Missing thread count!"
	exit 1
else
	threads=$1
fi

if [[ threads -gt 10 ]]
then
  threads=10
fi

regopt=""
if [[ "$#" == "2" && $2 =~ ^[0-9]+$ ]]; then
  regnum=$2
  regopt="-maxrregcount=${regnum}"
fi

NVCC_FLAGS="-gencode=arch=compute_60,code=sm_60"
NVCC_FLAGS="$NVCC_FLAGS -gencode=arch=compute_70,code=sm_70"
NVCC_FLAGS="$NVCC_FLAGS --use_fast_math -Xptxas -v -Xcompiler -fopenmp -O3 -I../../ $regopt"

cd float/
mkdir bin
for i in `cat ../p100_float.csv ../v100_float.csv`
do
	stencil=`echo $i | cut -d "," -f 1`
	if [[ -n `echo $stencil | grep 2d` ]]
	then
		bS1=`echo $i | cut -d "," -f 2`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`

		bench=`echo "$stencil"-"$bS1"-"$bT"-"$sl"`
	else
		bS1=`echo $i | cut -d "," -f 2`
		bS2=`echo $i | cut -d "," -f 3`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`

		bench=`echo "$stencil"-"$bS1"x"$bS2"-"$bT"-"$sl"`
	fi

	echo "Compiling $bench for float..."
	folder="./"
	nvcc -D SB_TYPE=float $NVCC_FLAGS "$folder"/"$bench"_host.cu "$folder"/"$bench"_kernel.cu -o "$folder"/bin/"$bench" > "$folder"/bin/"$bench".log 2>&1 &

	while [[ `ps -A | grep nvcc | wc -l` -ge $threads ]]
	do
		echo "Waiting for compilation to finish..."
		sleep 5
	done
done

cd ../double
mkdir bin
for i in `cat ../p100_float.csv  ../v100_float.csv`
do
	stencil=`echo $i | cut -d "," -f 1`
	if [[ -n `echo $stencil | grep 2d` ]]
	then
		bS1=`echo $i | cut -d "," -f 2`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`

		bench=`echo "$stencil"-"$bS1"-"$bT"-"$sl"`
	else
		bS1=`echo $i | cut -d "," -f 2`
		bS2=`echo $i | cut -d "," -f 3`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`

		bench=`echo "$stencil"-"$bS1"x"$bS2"-"$bT"-"$sl"`
	fi

	echo "Compiling $bench for double..."
	folder="./"
	nvcc -D SB_TYPE=double $NVCC_FLAGS "$folder"/"$bench"_host.cu "$folder"/"$bench"_kernel.cu -o "$folder"/bin/"$bench" > "$folder"/bin/"$bench".log 2>&1 &

	while [[ `ps -A | grep nvcc | wc -l` -ge $threads ]]
	do
		echo "Waiting for compilation to finish..."
		sleep 5
	done
done


# Final wait
while [[ `ps -A | grep nvcc | grep -v nvcc_comp | wc -l` -gt 0 ]]
do
	echo "Waiting for remaining compilations to finish..."
	sleep 5
done
