#!/bin/bash

##
# unstranded (as in Varabyou et al.)
##
parallel -j 5 kallisto quant -i ref/kallisto_idx -l 101 -s 0.0001 -t 8 -o quants/tissue{1}/sample{2}/kallisto_all_default --single simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 kallisto quant -i ref/kallisto_idx -l 101 -s 0.0001 -t 8 -o quants/tissue{1}/sample{2}/kallisto_real_default --single simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

##
# strand-specific 
##
parallel -j 5 kallisto quant -i ref/kallisto_idx -l 101 -s 0.0001 -t 8 -o quants/tissue{1}/sample{2}/kallisto_all_stranded_default --fr-stranded --single simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 kallisto quant -i ref/kallisto_idx -l 101 -s 0.0001 -t 8 -o quants/tissue{1}/sample{2}/kallisto_real_stranded_default --fr-stranded --single simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9
