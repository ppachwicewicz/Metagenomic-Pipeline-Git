module load trimmomatic/0.30
module load fastqc
for file in `cat srr.ids2`;do
	echo $file
	file_in1=fastq/${file}_1.fastq.gz
	file_in2=fastq/${file}_2.fastq.gz
	file_out_u1=trimmed/${file}_u1.fastq.gz
	file_out_u2=trimmed/${file}_u2.fastq.gz
	file_out_p1=trimmed/${file}_p1.fastq.gz
	file_out_p2=trimmed/${file}_p2.fastq.gz
	echo java -jar /apps/software/trimmomatic/0.30/trimmomatic-0.30.jar PE -phred33 $file_in1 $file_in2 $file_out_p1 $file_out_u1 $file_out_p2 $file_out_u2 TRAILING:6 MINLEN:60
	java -jar /apps/software/trimmomatic/0.30/trimmomatic-0.30.jar PE -phred33 $file_in1 $file_in2 $file_out_p1 $file_out_u1 $file_out_p2 $file_out_u2 TRAILING:6 MINLEN:60
	fastqc 	$file_out_p1 -o fastqc
	fastqc 	$file_out_p2 -o fastqc
done

exit
##original code
java -jar $CLASSPATH PE -phred33  SRR492183_1.fastq.gz SRR492183_2.fastq.gz SRR492183_1_paired.fastq.gz SRR492183_1_unpaired.fq.gz SRR492183_2_paired.fq.gz SRR492183_2_unpaired.fq.gz LEADING:6 TRAILING:6 SLIDINGWINDOW:1:6 MINLEN:60
