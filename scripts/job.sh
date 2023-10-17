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

# Check if pyenv is installed
if command -v pyenv 1>/dev/null 2>&1; then
    # Setup pyenv shell
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # Create a fresh virtual environment
    pyenv virtualenv env 1>/dev/null 2>&1
    pyenv activate env 1>/dev/null 2>&1

    # Check the exit status of the pyenv activate command
    if [ $? -ne 0 ]; then
        echo "\033[31mFailed to activate the virtual environment using pyenv. Exiting.\033[0m"
        exit 1
    fi

# Check if virtualenv is installed
elif command -v virtualenv 1>/dev/null 2>&1; then
    # Create a fresh virtual environment using virtualenv
    virtualenv env
    source env/bin/activate

    # Check the exit status of the virtual environment activation
    if [ $? -ne 0 ]; then
        echo "\033[31mFailed to activate the virtual environment using virtualenv. Exiting.\033[0m"
        exit 1
    fi
# If neither is installed, quit!
else
    echo "\033[31mNeither pyenv nor virtualenv are available. Exiting.\033[0m"
    exit 1
fi

# Makes sure that newly added modules are installed aswell
pip install -qr requirements.txt

# Runs the script
python src/main.py $@