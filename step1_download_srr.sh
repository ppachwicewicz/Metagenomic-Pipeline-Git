module load sra_tools/2.3.3-4
for file in `cat srr.ids`;do
echo $file
fastq-dump --outdir fastq --split-files --origfmt --gzip $file
done
