#!/bin/bash
#
rec_dir="~/RECYCLE"
if [ ! -e "$rec_dir" ]
	then
		echo $rec_dir doesn`t exist\n the directory will be created
		mkdir $rec_dir 
	else
		echo Deleting old files
		find $rec_dir -type f -ctime 7 > temp_string
		if [ "${#temp_string}" -ne "0" ]
			then 
				find $temp_string -type f -delete 
		fi
	fi
if [ -e $1 ]
	then
		tar --remove-files -zcf $rec_dir/$1$(date +%F_%H:%M).tar.gzip $1
	else
		echo File $1 doesn`t exist
fi
