#!/bin/bash
# run this script to make soft links in "bin" to the tools installed in the container

SIMG=samtools.sif

mkdir -p bin

bins=$(singularity exec ${SIMG} dpkg -L bwa samtools bcftools bowtie | grep /bin/)
for i in $bins
do
  echo $i
  ln -sf ../${SIMG} bin/${i##*/}
done
