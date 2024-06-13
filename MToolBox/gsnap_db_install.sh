#!/bin/bash
kmer=15
#########################################
decompress_fasta=True
database_name_rcrs=chrM
database_name_rsrs=chrRSRS
database_name_nfasta_rcrs=hg19RCRS
database_name_nfasta_rsrs=hg19RSRS

GENOME_FASTA=genome_fasta
if [ -d "$GENOME_FASTA" ]; then
        echo "$GENOME_FASTA already exists..."
else
        echo "Creating $GENOME_FASTA..."
        mkdir $GENOME_FASTA
fi

gmap_db=gmapdb
if [ -d "$gmap_db" ]; then
        echo "$gmap_db already exists..."
else
        echo "Creating $gmap_db..."
        mkdir $gmap_db
fi

download()
{
  URL=$1
  OFILE=$2
  wget  --no-check-certificate -c -nc -L "$URL" -O $OFILE
}

nfasta_rcrs_url=http://sourceforge.net/projects/mtoolbox/files/genome_fasta/hg19RCRS.fa.gz
nfasta_rcrs=hg19RCRS.fa.gz
nfasta_rsrs_url=http://sourceforge.net/projects/mtoolbox/files/genome_fasta/hg19RSRS.fa.gz
nfasta_rsrs=hg19RSRS.fa.gz
rcrs_mfasta_url=http://sourceforge.net/projects/mtoolbox/files/genome_fasta/chrM.fa.gz
rcrs_mfasta=chrM.fa.gz
rsrs_mfasta_url=http://sourceforge.net/projects/mtoolbox/files/genome_fasta/chrRSRS.fa.gz
rsrs_mfasta=chrRSRS.fa.gz

download $nfasta_rcrs_url $nfasta_rcrs
download $nfasta_rsrs_url $nfasta_rsrs
download $rcrs_mfasta_url $rcrs_mfasta
download $rsrs_mfasta_url $rsrs_mfasta

if [ "$decompress_fasta" == True ]; then
  echo "Building gmap db using $nfasta_rcrs..."
  gmap_build -D $gmap_db -d $database_name_nfasta_rcrs -g $nfasta_rcrs -s numeric-alpha -k $kmer
  echo "Building gmap db using $nfasta_rsrs..."
  gmap_build -D $gmap_db -d $database_name_nfasta_rsrs -g $nfasta_rsrs -s numeric-alpha -k $kmer
  echo "Building gmap db using $rcrs_mfasta..."
  gmap_build -D $gmap_db -d $database_name_rcrs -g $rcrs_mfasta -s numeric-alpha -k $kmer
  echo "Building gmap db using $rsrs_mfasta..."
  gmap_build -D $gmap_db -d $database_name_rsrs -g $rsrs_mfasta -s numeric-alpha -k $kmer
else
  echo "Building gmap db using $nfasta_rcrs..."
  gmap_build -D $gmap_db -d $database_name_nfasta_rcrs $nfasta_rcrs -s numeric-alpha -k $kmer
  echo "Building gmap db using $nfasta_rsrs..."
  gmap_build -D $gmap_db -d $database_name_nfasta_rsrs $nfasta_rsrs -s numeric-alpha -k $kmer
  echo "Building gmap db using $rcrs_mfasta..."
  gmap_build -D $gmap_db -d $database_name_rcrs $rcrs_mfasta -s numeric-alpha -k $kmer
  echo "Building gmap db using $rsrs_mfasta..."
  gmap_build -D $gmap_db -d $database_name_rsrs $rsrs_mfasta -s numeric-alpha -k $kmer
fi
echo "Building gmap db... Done."


#echo "Moving fasta files into $GENOME_FASTA..."
#                        
#mv $rcrs_mfasta $GENOME_FASTA
#mv $rsrs_mfasta $GENOME_FASTA
#mv $nfasta_rcrs $GENOME_FASTA
#mv $nfasta_rsrs $GENOME_FASTA
#
#if [ "$decompress_fasta"==True ]; then
#  cd $GENOME_FASTA
#  echo "Decompressing nfasta..."
#  for i in $(ls *.gz); do gzip -d $i; done &&
#  cd ..
#  echo "Done."
#else
#  echo "Done."
#fi

#echo "Generating fasta.fai indexes with samtools..."
#cd $GENOME_FASTA
#ls * > fasta.lst
#for i in $(cat fasta.lst); do
#    samtools faidx $i;
#done
#echo "Installation completed."


