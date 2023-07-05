#!/bin/sh

snakemake --delete-all-output -j 1; snakemake --profile slurm_multiple
