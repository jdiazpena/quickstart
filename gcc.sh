module load git
module load python3
module load cmake

unset MKLROOT
# in case used Intel compiler previously
# preinstalled MPI is broken on this system
module unload openmpi

# HPC often have some compiler versions that are broken.
# here's one we know works.
module load gcc/12.2.0
