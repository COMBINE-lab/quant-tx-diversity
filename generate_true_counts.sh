#!/bin/bash

TRC=./utils/true_read_counter/target/release/true_read_counter

for t in `seq 0 2`; do
  for s in `seq 0 9`; do
	echo "${TRC} simulated_reads/tissue${t}/sample${s}/simulated_all_shuffled.fq.gz > simulated_reads/tissue${t}/sample${s}/all_true_counts.tsv"
	${TRC} simulated_reads/tissue${t}/sample${s}/simulated_all_shuffled.fq.gz > simulated_reads/tissue${t}/sample${s}/all_true_counts.tsv
   done;
done
