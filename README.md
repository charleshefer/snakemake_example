# Snakemake example

A snakemake example, that current should run to completion, but is randomly failing.

# Issue

As soon as more than 1 job gets submitted concurrently to the queue, the jobs starts to fail. It appears to be specific to the installation of slurm on the eRI, as the code executes flawlessly on both NeSI and the old/current AgR hardware.


# What the workflow is doing 

This workflow generates 12 files in ./results/. One for each iteration of the array 0-5. The ./results/hostname_n.txt file contains the hostname where the job got executed. The ./results/file_n.txt file is a 10M binary file created with the dd command (dd if=/dev/zero of={output.file} bs=10M count=1).

The job sleeps between 5s and 10s after the creation of ./results/file_n.txt before it terminates.


# Installation

1) sh  setup.sh

This runs the required command to install snakemake and the python. No version is specified, since this should always be able to run (there are no other dependencies except for snakemake and python).


2) Activate conda-env with: conda activate ./conda-env 


2.1) sh run_single.sh

*** THIS WILL ONLY RUN ON THE ERI HARDWARE ***

This runs the Snakmake workflow, submitting jobs one after another to the queue. The workflow completes succesfully, with 12 files created in ./results. This is the expected behaviour of the workflow.

2.2) sh run_multiple.sh

** THIS WILL ONLY RUN ON THE ERI HARDWARE **

This runs the same Snakemake workflow, except that 6 jobs will be added to the queue simultanously. These jobs fail randomly. There logfiles (./logs) provides no debuggin information, and there appears to be no errors.


2.3) sh run_agr.sh

**THIS ONLY RUNS ON THE AGR HARDWARE, AND COMPLETES SUCCESFULLY WITH MULTIPLE JOBS SUBMITTED IN THE QUEUE**

This works as expected, with multiple jobs submitted to the queue, and the workflow completes without any errors.

2.4) sh run_nesi.sh

** THIS RUNS ON NESI, AND SUBMITS TO MILAN **
  
This works as expected, with multiple jobs submitted to the queue, and the workdlow completes.



