# quant-tx-diversity

First, set the appropriate paths for the programs in the `quant_sal.sh`, `quant_kallisto.sh` and `make_indices.sh` scripts.
Note that large amounts of data will be downloaded into subdirectories of this directory, so make sure substantial free-space is available (~500G).

Run the `prepare_results.sh` script to begin the process.

The quantification estimates produced by the different methods and configurations, as well as the true read counts, can be directly obtained from [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4437868.svg)](https://doi.org/10.5281/zenodo.4437868).

## dependencies

* basic nix tools
  * pv >= 1.6.6
  * gunzip >= 1.6
  * awk >= 4.1.3
  * paste >= 8.29
  * shuf >= 8.29
  
* pigz >= 2.3.4
* ripgrep >= 0.9.0
* GNU Parallel >= 20141022
* gffread >= 0.9.8
* samtools >= 1.11
* salmon >= 1.4.0 [version 1.4.0 was used in the note]
* kallisto >= 0.46.2 [version 0.46.2 was used in the note]
* rust (and cargo) >= 1.45.1
