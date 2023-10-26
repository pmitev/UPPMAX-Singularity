#!/bin/bash 

mkdir -p bin

if [ -z "${aptPACKAGES}" ]; then
  echo "\$aptPACKAGES not defined"; exit
else
  for ip in $aptPACKAGES; do

  bins=$(dpkg -L $ip  | grep /bin/)
  for i in $bins; do
    echo $i
    ln -sf ../${SINGULARITY_NAME} bin/${i##*/}
  done
done

ln -sf ../${SIMG} bin/STAR
ln -sf ../${SIMG} bin/STARlong
ln -sf ../${SIMG} bin/macs3 

fi
