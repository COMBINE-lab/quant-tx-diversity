#!/bin/bash

SAL=salmon

##
# full index
##

# default
parallel -j 5 ${SAL} quant -i ref/salmon_idx_saf -lA -r simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 -o quants/tissue{1}/sample{2}/salmon_all_default ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 ${SAL} quant -i ref/salmon_idx_saf -lA -r simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 -o quants/tissue{1}/sample{2}/salmon_real_default ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

# em 
parallel -j 5 ${SAL} quant -i ref/salmon_idx_saf -lA -r simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 --useEM -o quants/tissue{1}/sample{2}/salmon_all_em ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 ${SAL} quant -i ref/salmon_idx_saf -lA -r simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 --useEM -o quants/tissue{1}/sample{2}/salmon_real_em ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9


##
# reduced index
##

# default
parallel -j 5 ${SAL} quant -i ref/salmon_idx -lA -r simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 -o quants/tissue{1}/sample{2}/salmon_all_nodecoy_default ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 ${SAL} quant -i ref/salmon_idx -lA -r simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 -o quants/tissue{1}/sample{2}/salmon_real_nodecoy_default ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

# em 
parallel -j 5 ${SAL} quant -i ref/salmon_idx -lA -r simulated_reads/tissue{1}/sample{2}/simulated_all_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 --useEM -o quants/tissue{1}/sample{2}/salmon_all_nodecoy_em ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

parallel -j 5 ${SAL} quant -i ref/salmon_idx -lA -r simulated_reads/tissue{1}/sample{2}/simulated_real_shuffled.fq.gz -p 8 --fldMean 101 --fldSD 0.5 --useEM -o quants/tissue{1}/sample{2}/salmon_real_nodecoy_em ::: 0 1 2 ::: 0 1 2 3 4 5 6 7 8 9

