#!/bin/bash


echo "downloading simulated reads... may take a while"
wget ftp://ftp.ccb.jhu.edu/pub/avaraby/RNAseqNoise/simulated_reads.tar.gz

echo "decompressing simulated read data"
tar xzvf simulated_reads.tar.gz

mkdir -p ref
cd ref

echo "downloading matched reference (to decode CRAM)"
wget ftp://ftp.ccb.jhu.edu/pub/avaraby/RNAseqNoise/hg38_p12_ucsc.no_alts.no_fixs.fa

echo "downloading CHESS 2.2 annotation"
wget http://ccb.jhu.edu/chess/data/chess2.2_assembly.gff.gz
wget http://ccb.jhu.edu/chess/data/hg38_p8.fa.gz

echo "decompressing CHESS 2.2 annotation"
gunzip chess2.2_assembly.gff.gz
gunzip hg38_p8.fa.gz

cd ..
