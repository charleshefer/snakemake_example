#!/bin/sh

conda create -p ./conda-env -c conda-forge -c bioconda -y snakemake python --solver lib-mamba
