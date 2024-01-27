# simdir is where simulation output HDF5 files will be written as simulation runs

# exsrc= defined like in gemci.sh
# gmbin= defined like in gemini3d.job

rootdir=/projectnb/semetergrp/gemini3dfbi

configdir=${rootdir}/configfiles/said/
simroot=${rootdir}/gemini3d_sims
simdir=${simroot}/240127_said_v_30m075JnoBG_512x512x512

python -m gemini3d.run ${configdir} ${simdir} -gemexe ${prefix}/gemini.bin

CMAKE_PREFIX_PATH=${prefix} mpirun -np 512 ${prefix}/bin/gemini.bin ${simdir}