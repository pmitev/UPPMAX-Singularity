#!/bin/bash
# run this script to make soft links in "bin" to the tools installed in the container

SIMG=BioTools-ubuntu.sif
read -r -d '' PACKAGES << EOL
 samtools salmon bowtie2 picard samblaster fastqc qcumber bedtools \
 bwa bcftools bowtie2 snap-aligner trim-galore wham-align minimap2\
 anfo samclip
EOL

mkdir -p bin

for ip in $PACKAGES
do

  bins=$(singularity exec ${SIMG} dpkg -L $ip  | grep /bin/)

  for i in $bins
  do
    echo $i
    ln -sf ../${SIMG} bin/${i##*/}
  done

done

ln -sf ../${SIMG} bin/STAR
ln -sf ../${SIMG} bin/STARlong
ln -sf ../${SIMG} bin/macs3
