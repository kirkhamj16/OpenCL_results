#!/bin/bash

#SBATCH --nodes=1

#BATCH --ntasks-per-node=1

#SBATCH --gres=gpu:1

#SBATCH --time=24:00:00

#SBATCH --mail-type=begin

#SBATCH --mail-type=end

#SBATCH --mail-user=jak4@princeton.edu

cd /home/jak4/iws19/OpenCLLitmus_v_2/build/bin/

echo `date`

echo "MP NO_STRESS"

./litmus_exe -i 2000 -D MEM_STRESS=0 ../../../OpenCL_tests/interwg_base/MP

echo "MP NO ID SHUFFLE, DEFAULT"

./litmus_exe -i 2000 -D MEM_STRESS=1 ../../../OpenCL_tests/interwg_base/MP

echo "MP NO BARRIER, DEFAULT"

./litmus_exe -i 2000 -D MEM_STRESS=1 -D ID_SHUFFLE=1 ../../../OpenCL_tests/interwg_base/MP

echo "MP BARRIER, SHUFFLE, DEFAULT"

./litmus_exe -i 2000 -D MEM_STRESS=1 -D ID_SHUFFLE=1 -D BARRIER=1 ../../../OpenCL_tests/interwg_base/MP

echo "MP, ST LD"

./litmus_exe -i 2000 -D X_Y_STRIDE=32 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=256 -D PRE_STRESS_PATTERN=2 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=512 ../../../OpenCL_tests/interwg_base/MP

echo "MP, ST ST"

./litmus_exe -i 2000 -D X_Y_STRIDE=32 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=256 -D PRE_STRESS_PATTERN=1 -D STRESS_PATTERN=0 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=512 ../../../OpenCL_tests/interwg_base/MP

echo "MP, LD LD"

./litmus_exe -i 2000 -D X_Y_STRIDE=32 -D PRE_STRESS=1 -D PRE_STRESS_ITERATIONS=256 -D PRE_STRESS_PATTERN=3 -D STRESS_PATTERN=1 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=512 ../../../OpenCL_tests/interwg_base/MP

echo "MP, LD ST"

./litmus_exe -i 2000 -D X_Y_STRIDE=32 -D STRESS_PATTERN=2 -D ID_SHUFFLE=1 -D BARRIER=1 -D MEM_STRESS=1 -D STRESS_ITERATIONS=512 ../../../OpenCL_tests/interwg_base/MP
