if [[ -z $1 ]]
then
	echo "Missing GPU name!"
	exit 1
else
	gpu=$1
fi

mkdir "$gpu"

prec="float"
mkdir "$gpu"/"$prec"
echo "Stencil","bS1","bS2","bT","sl","Model","Measured" > "$gpu"/"$prec"_run.csv
for i in `cat "$gpu"_"$prec".csv`
do
	stencil=`echo $i | cut -d "," -f 1`
	if [[ -n `echo $stencil | grep 2d` ]]
	then
		bS1=`echo $i | cut -d "," -f 2`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`
		model=`echo $i | cut -d "\"" -f 2 | tr -d ","`
		
		bench=`echo "$stencil"-"$bS1"-"$bT"-"$sl"`

		echo "Running $bench for $prec..."
		CUDA_VISIBLE_DEVICES=0 "$prec"/bin/"$bench" -s 16384 -t 1000 -n 5 > "$gpu"/"$prec"/"$bench".log 2>&1

		flops=`cat "$gpu"/"$prec"/"$bench".log | grep Average | tr -s " " | cut -d " " -f 2`
		if [[ -z "$flops" ]]
		then
			flops="Failed"
		fi

		echo "$stencil","$bS1",,"$bT","$sl","$model","$flops" >> "$gpu"/"$prec"_run.csv
	else
		bS1=`echo $i | cut -d "," -f 2`
		bS2=`echo $i | cut -d "," -f 3`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`
		model=`echo $i | cut -d "\"" -f 2 | tr -d ","`

		bench=`echo "$stencil"-"$bS1"x"$bS2"-"$bT"-"$sl"`

		echo "Running $bench for $prec..."
		CUDA_VISIBLE_DEVICES=0 "$prec"/bin/"$bench" -s 512 -t 1000 -n 5 > "$gpu"/"$prec"/"$bench".log 2>&1

		flops=`cat "$gpu"/"$prec"/"$bench".log | grep Average | tr -s " " | cut -d " " -f 2`
		if [[ -z "$flops" ]]
		then
			flops="Failed"
		fi

		echo "$stencil","$bS1","$bS2","$bT","$sl","$model","$flops" >> "$gpu"/"$prec"_run.csv
	fi
done

prec="double"
mkdir "$gpu"/"$prec"
echo "Stencil","bS1","bS2","bT","sl","Model","Measured" > "$gpu"/"$prec"_run.csv
for i in `cat "$gpu"_"$prec".csv`
do
	stencil=`echo $i | cut -d "," -f 1`
	if [[ -n `echo $stencil | grep 2d` ]]
	then
		bS1=`echo $i | cut -d "," -f 2`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`
		model=`echo $i | cut -d "\"" -f 2 | tr -d ","`
		
		bench=`echo "$stencil"-"$bS1"-"$bT"-"$sl"`

		echo "Running $bench for $prec..."
		CUDA_VISIBLE_DEVICES=0 "$prec"/bin/"$bench" -s 16384 -t 1000 -n 5 > "$gpu"/"$prec"/"$bench".log 2>&1

		flops=`cat "$gpu"/"$prec"/"$bench".log | grep Average | tr -s " " | cut -d " " -f 2`
		if [[ -z "$flops" ]]
		then
			flops="Failed"
		fi

		echo "$stencil","$bS1",,"$bT","$sl","$model","$flops" >> "$gpu"/"$prec"_run.csv
	else
		bS1=`echo $i | cut -d "," -f 2`
		bS2=`echo $i | cut -d "," -f 3`
		bT=`echo $i | cut -d "," -f 4`
		sl=`echo $i | cut -d "," -f 5`
		model=`echo $i | cut -d "\"" -f 2 | tr -d ","`

		bench=`echo "$stencil"-"$bS1"x"$bS2"-"$bT"-"$sl"`

		echo "Running $bench for $prec..."
		CUDA_VISIBLE_DEVICES=0 "$prec"/bin/"$bench" -s 512 -t 1000 -n 5 > "$gpu"/"$prec"/"$bench".log 2>&1

		flops=`cat "$gpu"/"$prec"/"$bench".log | grep Average | tr -s " " | cut -d " " -f 2`
		if [[ -z "$flops" ]]
		then
			flops="Failed"
		fi

		echo "$stencil","$bS1","$bS2","$bT","$sl","$model","$flops" >> "$gpu"/"$prec"_run.csv
	fi
done
