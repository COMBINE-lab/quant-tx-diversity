#!/bin/bash

for t in `seq 0 2`; do
  for s in `seq 0 9`; do
    for fn in simulated_reads/tissue${t}/sample${s}/*.cram; do
      basedir=`dirname ${fn}`
      echo "basedir = $basedir"
      echo "samtools bam2fq -F0x100 --reference ref/hg38_p12_ucsc.no_alts.no_fixs.fa -@ 8 ${fn} | pigz -p 8 >> ${basedir}/simulated_all.fq.gz"
      samtools bam2fq -F0x100 --reference ref/hg38_p12_ucsc.no_alts.no_fixs.fa -@ 8 ${fn} | pigz -p 8 >> ${basedir}/simulated_all.fq.gz
    done
  done
done
