#!/bin/bash -l
#SBATCH -A project
#SBATCH -n 40 -p devel
#SBATCH -t 5:00

module load gcc/11.3.0 openmpi/4.1.2

env > env.txt

mpirun singularity exec mpi-test.sif /opt/mpi-test/mpi-test

singularity exec mpi-test.sif  mpirun --launch-agent 'singularity exec /FULL_PATH/mpi-test.sif orted' /opt/mpi-test/mpi-test
