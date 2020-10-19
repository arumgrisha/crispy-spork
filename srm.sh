#!/bin/bash
#
rec_dir=~/RECYCLE/
if test -z $1;
	then
		echo "There is no filename in argument"
	else
		echo "Safe removing: $1"
fi
echo $rec_dir

if test -d $rec_dir;
	then
		echo "~/RECYCLE exists"
	else
		echo "Creating ~/RECYCLE";
		mkdir $rec_dir
fi

#это комментарий многостроковый
#: '
#smth
#'

#if [[ $1 = "" ]];
#	then
#		echo "There is no filename in argument2"
#	else
#		echo "$1"
#fi

rm_file_string=$1 # вводить можно только название файла в которой находитесь. В названии не должно быть пути. В директории RECYCLE вводить нельзя.
touch ./$rm_file_string #для отладки, потом удалить
mv $rm_file_string $rec_dir
echo $rm_file_string

temp1="$rec_dir""$rm_file_string"
gzip $temp1
temp1=""

echo "Succeed in srm $rm_file_string"

#rm_file_string_2="$rm_file_string"".gz" #для отладки, потом удалить
#rm_file_string_2=${rm_file_string + ".gz"} #для отладки, потом удалить. Или так добавить окончание .gz. Чего-то не работает

temp1="$rec_dir""$rm_file_string"".gz"
rm $temp1 #для отладки, потом удалить
temp1=""

temp1="$rec_dir""temp_folder"
echo $temp1
touch $temp1
find -mtime +6 ${rec_dir::-1} #| >temp1

#rm $temp1
temp1=""
