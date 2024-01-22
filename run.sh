# simdir is where simulation output HDF5 files will be written as simulation runs

# exsrc= defined like in gemci.sh
# gmbin= defined like in gemini3d.job

infile=${exsrc}/cfg/hourly/mini3d_fang/config.nml
simroot=$HOME/gemini3d_sims
simdir=${simroot}/mini3d_fang
mkdir -p ${simdir}
cp ${infile} ${simdir}/inputs/
python -m gemini3d.run ${simdir} -gemexe ${gmbin}/gemini.bin
