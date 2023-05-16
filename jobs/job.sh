#!/bin/bash 

#SBATCH --mail-user=<INSERT YOUR EMAIL HERE>
#SBATCH --mail-type=FAIL
#SBATCH --partition=All
#SBATCH --export=NONE

# Use --partition=NvidiaAll if you need nodes with a gpu

# Set Environment Variables
# export WANDB_MODE="disabled" # Use if you want to disable wandb logging
export WANDB_SILENT="true"

# Setup pyenv shell
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Create a fresh virtual environment
pyenv virtualenv env &> /dev/null
pyenv activate env &> /dev/null

# Check the exit status of the pyenv activate command
if [ $? -ne 0 ]; then
    echo "Failed to activate the virtual environment. Exiting."
    exit 1
fi

# Makes sure that newly added modules are installed aswell
pip install -qr requirements.txt

# Runs the script
python src/main.py $@