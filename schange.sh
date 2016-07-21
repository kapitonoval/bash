#!/bin/bash
#
# запрашиват количество дней относительно сегодняшней даты
# выводит наименования файлов, которые редактировались за последнее время
#
#	
# @author  	Alexey Kapitonov
# @version 	20/06/2016

# cd ./



echo "How many days?";
read days  
if [days == ''];
then
days=1
fi

DATE_START=`date -d "-"$days" day" +%Y-%m-%d`
DATE_END=`date -d "tomorrow" +%Y-%m-%d`

echo $DATE_START;
echo $DATE_END;


find ./ -name '*.*' -not -path "./webstat/*"  -not -name *.doc -not -name *.jpg -not -name *.png -not -name *.jpeg -newermt $DATE_START ! -newermt $DATE_END  | while read file; do



if [ "$file" = "./" ]
then
echo $file
else
ls -l  $file | awk '{print  $7 " " $6 " " $8 " " $9}' 
#ls -l  $file
#echo $file 
fi 

done

