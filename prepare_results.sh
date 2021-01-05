#!/bin/bash


echo "======"
echo "building utilities"
echo "======"
cd utils/true_read_counter
cargo build --release
cd ../..

echo "======"
echo "obtaining input data"
echo "======"
bash get_data.sh

echo "======"
echo "preparing indices"
echo "======"
bash make_indices.sh

echo "======"
echo "extracting simulated reads from CRAM files"
echo "======"
bash cram_to_fastq.sh

echo "======"
echo "shuffling simulated reads"
echo "======"
bash shuffle_all.sh

echo "======"
echo "subsampling 'real' reads from 'all' reads"
echo "======"
bash subsample_real.sh

echo "======"
echo "generating ground-truth count file"
echo "======"
bash generate_true_counts.sh


echo "======"
echo "performing quantification"
echo "======"
bash quant_sal.sh
bash quant_kallisto.sh

mkdir -p figures

echo "======"
echo "results should be prepared in the quants sub-directory"
echo "======"
