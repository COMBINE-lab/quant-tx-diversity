# quant-tx-diversity

First, set the appropriate paths for the programs in the `quant_sal.sh`, `quant_kallisto.sh` and `make_indices.sh` scripts.
Note that large amounts of data will be downloaded into subdirectories of this directory, so make sure substantial free-space is available (~500G).

Run the `prepare_results.sh` script to being the process.

## dependencies

* basic nix tools
  * pv >= 1.6.6
  * gunzip >= 1.6
  * awk >= 4.1.3
  * paste >= 8.29
  
* pigz >= 2.3.4
* shuf >= 8.29
* ripgrep >= 0.9.0
* GNU Parallel >= 20141022
* gffread >= 0.9.8
* salmon >= 1.4.0
* kallisto >= 0.46.2
