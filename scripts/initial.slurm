#!/bin/bash

#SBATCH --nodes=1

#BATCH --ntasks-per-node=1

#SBATCH --gres=gpu:1

#SBATCH --time=0:01:00

cd /home/jak4/iws19/OpenCLLitmus/FirstGo/build/bin/

./litmus_exe ../../../tests/MP
./litmus_exe ../../../tests/LB
./litmus_exe ../../../tests/SB
