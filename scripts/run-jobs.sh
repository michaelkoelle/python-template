#!/bin/bash

# Specify hyperparameters
runs=20
datasets=("iris" "wine")
approaches=("random" "OL-NN-EP" "TL-NN-EP" "OL-NN" "TL-NN")

# Check if sbatch is available
if command -v sbatch > /dev/null; then
  sbatch_cmd="sbatch"
else
  echo "\033[1;31mYou are not in a slurm environment. Executing experiments sequentially!\033[0m"
  sbatch_cmd=""
fi

for dataset in ${datasets[@]}; do
    for approach in ${approaches[@]}; do
        for seed in $(seq 0 $(($runs-1))); do
            if [ -z "$sbatch_cmd" ]; then
                echo "\033[1;32mExecuting job with environment variables:\033[0m -d $dataset -a $approach -s $seed"
                ./scripts/job.sh -d $dataset -a $approach -s $seed -e $epoch
            else
                $sbatch_cmd --job-name="run-$dataset-$approach-$seed" scripts/job.sh -d $dataset -a $approach -s $seed
            fi
        done
    done
done