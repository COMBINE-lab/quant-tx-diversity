#!/bin/bash

GFFREAD=gffread
KALLISTO=kallisto
SALMON=salmon

## extract the transcripts from the CHESS 2.2 annotation
${GFFREAD} -w ref/transcripts.fa -g ref/hg38_p8.fa ref/chess2.2_assembly.gff

## make the kallisto index
${KALLISTO} index -i ref/kallisto_idx ref/transcripts.fa

## make the decoy list and gentrome
rg "^>" ref/hg38_p12_ucsc.no_alts.no_fixs.fa | cut -d ">" -f2 | ref/decoys.txt
cat ref/transcripts.fa hg38_p12_ucsc.no_alts.no_fixs.fa > ref/gentrome.fa

## make the salmon-reduced index
${SALMON} index -i ref/salmon_idx -p16 -t ref/transcripts.fa

## make the full salmon index 
${SALMON} index -i ref/salmon_idx_saf -p16 -t ref/gentrome.fa -d ref/decoys.txt
