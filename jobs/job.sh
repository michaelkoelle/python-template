#!/bin/bash 

#SBATCH --mail-user=<INSERT YOUR EMAIL HERE>
#SBATCH --mail-type=FAIL
#SBATCH --partition=All
#SBATCH --export=NONE

# Use --partition=NvidiaAll if you need nodes with a gpu

# Create a fresh virtual environment
pyenv virtualenv env
pyenv activate env

# Makes sure that newly added modules are installed aswell
pip install -r requirements.txt

# Runs the script
python src/main.py $@