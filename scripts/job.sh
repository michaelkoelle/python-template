#!/bin/bash

# SLURM configuration
# Use #SBATCH <option>=<value> to configure. Do not uncomment lines with #SBATCH
# Ref: https://doku.lrz.de/slurm-workload-manager-10745909.html
# Use sinfo to see all availiable partitions
# For LMU Cip SLURM, use --partition=NvidiaAll if you need nodes with a gpu

#SBATCH --mail-user=<INSERT YOUR EMAIL HERE>
#SBATCH --mail-type=FAIL
#SBATCH --partition=All
#SBATCH --export=NONE

# Environment Variables
# export WANDB_MODE="disabled" # Use if you want to disable wandb logging
export WANDB_SILENT="true"

# Check if uv is installed
if ! command -v uv 1>/dev/null 2>&1; then
    # Install uv into ~/.local/bin (no root required)
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

# Creates the virtual environment and installs the locked dependencies, then runs the script
uv run src/main.py "$@"