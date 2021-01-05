#!/bin/bash

for t in `seq 0 2`; do
  for s in `seq 0 9`; do
    bash shuffle.sh -i simulated_reads/tissue${t}/sample${s}/simulated_all.fq.gz
  done
done
