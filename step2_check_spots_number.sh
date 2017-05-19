rm -f counts_spots_file.txt
for file in `cat srr.ids`;do
	echo ${file}
	var1=`gunzip -c fastq/${file}_1.fastq.gz| wc -l | gawk '{print $1}'`
	var4=`expr $var1 / 4`
	echo ${file}"|1|"${var4} >> counts_spots_file.txt
	var2=`gunzip -c fastq/${file}_2.fastq.gz| wc -l | gawk '{print $1}'`
	var4=`expr $var2 / 4`
	echo ${file}"|2|"${var4} >> counts_spots_file.txt
done
