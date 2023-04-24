#!/bin/bash

# Specify hyperparameters
runs=20
envs=("CartPole-v1" "Pendulum-v1")
agents=("random" "PPO" "DQN" "A2C")

for env in ${envs[@]}; do
    for agent in ${agents[@]}; do
        for seed in $(seq 0 $(($runs-1))); do
            sbatch --job-name="run-$env-$agent-$seed" jobs/job.sh -e $env -a $agent -s $seed
        done
    done
done