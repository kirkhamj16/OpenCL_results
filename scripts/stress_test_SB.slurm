#!/bin/bash

#SBATCH --nodes=1

#BATCH --ntasks-per-node=1

#SBATCH --gres=gpu:1

#SBATCH --time=00:01:00

#SBATCH --mail-type=begin

#SBATCH --mail-type=end

#SBATCH --mail-user=jak4@princeton.edu

cd /home/jak4/iws19/OpenCLLitmus_v_2/build/bin/

echo `date`

echo "SB ST LD"

./litmus_exe -i 1000 -D X_Y_STRIDE=7 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=50 -D PRE_STRESS_PATTERN=2 -D STRESS_PATTERN=3 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=1024 ../../../OpenCL_tests/interwg_base/SB

echo "SB ST ST"

./litmus_exe -i 1000 -D X_Y_STRIDE=7 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=50 -D PRE_STRESS_PATTERN=1 -D STRESS_PATTERN=0 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=1024 ../../../OpenCL_tests/interwg_base/SB

echo "SB LD LD"

./litmus_exe -i 1000 -D X_Y_STRIDE=7 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=50 -D PRE_STRESS_PATTERN=0 -D STRESS_PATTERN=1 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=1024 ../../../OpenCL_tests/interwg_base/SB

echo "SB LD ST"

./litmus_exe -i 1000 -D X_Y_STRIDE=7 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=50 -D PRE_STRESS_PATTERN=3 -D STRESS_PATTERN=2 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=1024 ../../../OpenCL_tests/interwg_base/SB
