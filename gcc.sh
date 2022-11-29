module load git
module load python3
module load cmake

unset MKLROOT
# in case used Intel compiler previously

# feel free to use any modern compiler such as GCC >= 8, Intel oneAPI. 
# Here's one we know works on this specific HPC.
module load gcc/9.3.0 

# an MPI library compatible with the selected compiler.
module load openmpi/3.1.4_gnu-9.3.0 
