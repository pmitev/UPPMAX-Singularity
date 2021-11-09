#!/bin/bash -l
#SBATCH -J test
#SBATCH -t 00:15:00 
#SBATCH -p devel -N 2 -n 2 
##SBATCH -p node -N 2 -n 2
#SBATCH --cpus-per-task 20
#SBATCH -A staff


module load gcc/7.2.0 openmpi/2.1.1
env > env.log

#mpirun -n 2 gromacs-apt18.sif -ntomp 20 -s benchMEM.tpr -nsteps 10000 -resethway
##mpirun -n 2 -mca btl ^openib gromacs-apt.sif -ntomp 4 -s benchMEM.tpr -nsteps 10000 -resethway

scontrol show hostname $SLURM_NODELIST > host
#singularity exec -B /etc/hosts.equiv -B /etc/ssh  gromacs-apt18.sif mpirun -n 2 -mca plm_base_verbose 10 -mca plm rsh -d -display-allocation -display-map -report-uri - --hostfile host --launch-agent '/usr/bin/singularity exec /crex/proj/staff/pmitev/nobackup/RT-support/RT-gromac-singularity/gromacs-apt18.sif /usr/bin/orted' /usr/bin/mdrun_mpi -ntomp 20 -s benchMEM.tpr -nsteps 10000 -resethway
singularity exec -B /etc/hosts.equiv -B /etc/ssh -B /etc/slurm:/etc/slurm-llnl -B /run/munge gromacs-apt.sif mpirun -n 2 -mca plm_base_verbose 10 -mca -d -display-allocation -display-map -report-uri - --hostfile host --launch-agent '/usr/bin/singularity exec /crex/proj/staff/pmitev/nobackup/RT-support/RT-gromac-singularity/gromacs-apt.sif /usr/bin/orted' /usr/bin/mdrun_mpi -ntomp 20 -s benchMEM.tpr -nsteps 10000 -resethway


# -mca plm rsh
# -mca plm_rsh_agent rsh
# -mca plm_base_verbose 10
# -report-uri - -display-allocation -display-map




