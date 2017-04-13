#!/bin/sh

# Details on evaluation.py arguments:
# evaluation.py <metric: precision|mdcg> <output_filename> <ground-truth_path> <ranking-list>

debug_msg="EVALUATION"

echo
echo $debug_msg - start

if [ ! -d out/indices ]; then
    echo $debug_msg - cannot find \"out/indices\" directory...
    echo $debug_msg - exiting...
    exit 1
fi

if [ -d out/evaluation ]; then
    rm -r out/evaluation
fi
mkdir out/evaluation
mkdir out/evaluation/benchmark
mkdir out/evaluation/aggregation
mkdir out/evaluation/plots

# Evaluation of all the possible configurations
for stemmer in ${stemmer_names[@]}; do
	for scorer_function in ${scorer_functions[@]}; do
		echo -e "\n*****************************************"
		echo "Evaluation for the configuration: [$stemmer, $scorer_function]"
		echo -e "*****************************************\n"
		for field in ${fields[@]}; do
			echo "Evaluating averaged R-Precision of [$stemmer, $scorer_function, ${field}]"
			averaged_r_precision=$(python3 scripts/evaluation.py precision Cranfield_DATASET/cran_Ground_Truth.tsv out/scores/${stemmer}/${scorer_function}/${field}.tsv)
			echo -e "$stemmer\t$scorer_function\t$field\t$averaged_r_precision" >> out/evaluation/benchmark/averaged_r_precision.out

			for current_k in ${k_values[@]}; do
				echo "Evaluating averaged nMDCG of [$stemmer, $scorer_function, ${field}] with k=$current_k"
				current_averaged_nMDCG=$(python3 scripts/evaluation.py mdcg Cranfield_DATASET/cran_Ground_Truth.tsv out/scores/${stemmer}/${scorer_function}/${field}.tsv $current_k)

				echo -e "$stemmer\t$scorer_function\t$field\t$current_averaged_nMDCG" >> out/evaluation/benchmark/averaged_nMDCG_$current_k.out

				echo -e "$current_k\t$current_averaged_nMDCG" >> out/evaluation/plots/averaged_nMDCG_${stemmer}_${scorer_function}_${field}.out
			done
		done
	done
done

echo "Evaluating Averaged R-Precision of 'fagin' output"
averaged_r_precision=$(python3 scripts/evaluation.py precision  Cranfield_DATASET/cran_Ground_Truth.tsv out/aggregation/fagin.out)
echo -e "fagin\t$averaged_r_precision" >> out/evaluation/aggregation/aggregation_averaged_r_precision.out
for current_k in ${k_values[@]}; do
	echo "Evaluating Averaged nMDCG of 'fagin' output with k=${current_k}"
	current_averaged_nMDCG=$(python3 scripts/evaluation.py mdcg Cranfield_DATASET/cran_Ground_Truth.tsv out/aggregation/fagin.out ${current_k})

	echo -e "fagin\t$averaged_r_precision" >> out/evaluation/aggregation/aggregation_averaged_nMDCG_k${current_k}.out
done

#threshold
echo "Evaluating Averaged R-Precision of 'threshold' output"
averaged_r_precision=$(python3 scripts/evaluation.py precision Cranfield_DATASET/cran_Ground_Truth.tsv out/aggregation/threshold.out)
echo -e "threshold\t$averaged_r_precision" >> out/evaluation/aggregation/aggregation_averaged_r_precision.out

for current_k in ${k_values[@]}; do
	echo "Evaluating Averaged nMDCG of 'threshold' output with k=${current_k}"

	current_averaged_nMDCG=$(python3 scripts/evaluation.py mdcg Cranfield_DATASET/cran_Ground_Truth.tsv out/aggregation/threshold.out ${current_k})

	echo -e "threshold\t$current_averaged_nMDCG" >> out/evaluation/aggregation/aggregation_averaged_nMDCG_k${current_k}.out
done
echo $debug_msg - done!
echo
