###############################################################################
#Standalone example to test snakemake on the eRI
#
#
#
#@author: charles.hefer@agresearch.co.nz
###############################################################################


def get_random_time(wildcards):
	import random
	return(random.randint(5,10))

rule all:
	input:
		expand("results/{target}_{iter}.txt", target=["file","hostname"], iter=range(0,5,1))


rule create_file:
	input:
	output:
		file = "results/file_{iter}.txt",
		hostname = "results/hostname_{iter}.txt"
	params:
		delay = get_random_time
	threads: 1
	shell:
		"""
			hostname > {output.hostname};
			dd if=/dev/zero of={output.file} bs=10M count=1;
			sleep {params.delay}
		"""

