[[ -v rdir ]] || rdir=$HOME/code

pysrc=${rdir}/pygemini
pybr=main
pyurl=https://github.com/gemini3d/pygemini
if [[ -d ${pysrc} ]]; then
  git -C ${pysrc} switch ${pybr}
  git -C ${pysrc} pull
else
  git -C ${rdir} clone ${pyurl} ${pysrc}
fi
python -m pip install -e ${pysrc}
