#################################### for LYJ #############################
## delete records with duplicates in wig file
p=0
cat GSM2236619_Bcatenin.mouse.wig | while read line;do
	if [ ${line:0:1} = "f" ];then
		l=`grep "$line" fixedStep.txt | wc -l`
		if [ $l = 0 ];then
			p=0
			echo $line >> fixedStep.txt
			echo $line >> res.wig
		else
			p=1
		fi
	elif [ $p = 0 ];then
		echo $line >> res.wig
	fi
done
