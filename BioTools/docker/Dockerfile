FROM ubuntu:22.04

ENV LC_ALL=C
ENV PYTHONNOUSERSITE=True
ENV PATH=$PATH:/opt/STAR-2.7.11a/bin/Linux_x86_64_static

ARG DEBIAN_FRONTEND=noninteractive
ENV aptPACKAGES="python3-deeptools \
    abyss \
    anfo \
    augustus \
    bbmap \
    bcftools \
    beast2-mcmc \
    bedtools \
    bowtie2 \
    busco \
    bwa \
    canu \
    cd-hit \
    cutadapt \
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
    ncbi-blast+ \
    paml \
    pbbamtools \
    phast \
    picard \
    pilon \
    pplacer \
    qcumber \
    qiime \
    quicktree \
    ray \
    salmon \
    samblaster \
    samclip \
    samtools \
    snap-aligner \
    snpeff \
    spades \
    stacks \
    tophat-recondition \
    trim-galore \
    trinityrnaseq \
    velvet \
    vienna-rna \
    wham-align \
    " 

RUN apt-get update && apt-get -y dist-upgrade 
RUN apt-get install -y git wget build-essential cmake gfortran vim gawk\
    python3-venv python3-pip zlib1g-dev xxd \
    $aptPACKAGES

# STAR https://github.com/alexdobin/STAR
RUN cd /opt &&  wget https://github.com/alexdobin/STAR/archive/2.7.11a.tar.gz && \
    tar -xzf 2.7.11a.tar.gz &&  cd STAR-2.7.11a/source &&  make -j 4 STAR

RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    python3 -m pip install --no-cache-dir --upgrade macs3
