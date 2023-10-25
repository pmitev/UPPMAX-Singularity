#!/bin/bash
# run this script to make soft links in "bin" to the tools installed in the container

SIMG=BioTools-ubuntu.sif
read -r -d '' PACKAGES << EOL
    python3-deeptools \
    abyss \
    anfo \
    augustus \
    bcftools \
    beast2-mcmc \
    bedtools \
    bowtie2 \
    busco \
    bwa \
    canu \
    cd-hit \
    exonerate \
    fasta3 \
    fastqc \
    gffread \
    hmmer \
    igv \
    infernal \
    jellyfish \
    mafft \
    minimap2 \
    mrbayes \
    pbbamtools \
    picard \
    pilon \
    pplacer \
    qcumber \
    quicktree \
    ray \
    salmon \
    samblaster \
    samclip \
    samtools \
    snap-aligner \
    snpeff \
    spades \
    trim-galore \
    trinityrnaseq \
    velvet \
    wham-align \
EOL

mkdir -p bin

for ip in $PACKAGES; do

  bins=$(singularity exec ${SIMG} dpkg -L $ip  | grep /bin/)
  for i in $bins; do
    echo $i
    ln -sf ../${SIMG} bin/${i##*/}
  done
done

ln -sf ../${SIMG} bin/STAR
ln -sf ../${SIMG} bin/STARlong
ln -sf ../${SIMG} bin/macs3
