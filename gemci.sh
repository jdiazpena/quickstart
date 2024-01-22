[[ -v rdir ]] || rdir=$HOME/code

exsrc=${rdir}/gemci
exbr=main
exurl=https://github.com/gemini3d/gemci
if [[ -d ${exsrc} ]]; then
  git -C ${exsrc} switch ${exbr}
  git -C ${exsrc} pull
else
  git -C ${rdir} clone ${exurl} ${exsrc}
fi
