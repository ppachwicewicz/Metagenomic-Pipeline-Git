#!/bin/bash

#PBS -N localBlast
#PBS -S /bin/bash
#PBS -l nodes=4:ppn=16
#PBS -l walltime=0:59:00
#PBS -L mem=8gb

time modules_create-fastq_nesoni.sh

module load java/jdk1.8.0_45
module load SHRiMP/2.2.3
module load samtools/1.3.1
module load python/2.7.6
module load R/3.3.1

#Convert FASTA files from MetaSim into Fastq files using fasta_to_fastq.pl file
perl fasta_to_fastq.pl *.fasta > converted.fq

nesoni clip *.fq


STARTTIME=$(date +%s)
#........
#........
ENDTIME=$(date +%s)
echo "It takes $[$ENDTIME - $STARTTIME] seconds to complete this task..."

