#!/bin/bash

for t in `seq 0 2`; do
  for s in `seq 0 9`; do
    echo "gunzip -c simulated_reads/tissue${t}/sample${s}/simulated_all_shuffled.fq.gz | rg --context-separator \"\" -A3 \"^@read[0-9]+/CHS\.\" | pigz -p 8 >> simulated_reads/tissue${t}/sample${s}/simulated_real_shuffled.fq.gz"
    gunzip -c simulated_reads/tissue${t}/sample${s}/simulated_all_shuffled.fq.gz | rg --context-separator "" -A3 "^@read[0-9]+/CHS\." | pigz -p 8 >> simulated_reads/tissue${t}/sample${s}/simulated_real_shuffled.fq.gz
  done
done


