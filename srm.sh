#!/bin/bash
#
rec_dir=~/RECYCLE/ #Определяем местоположение корзины
if test -z $1; #Проверяем получение аргумента (названия файла)
	then
		echo "There is no filename in argument";
		return #Выходим из функции
	else
		echo "Safe removing: $1"
fi

#echo $rec_dir

if test -d $rec_dir; #Проверяем существование корзины
	then
		echo "~/RECYCLE exists"
	else
		echo "Creating ~/RECYCLE";
		mkdir $rec_dir
		return #Выходим из функции
fi

#Это комментарий многостроковый
#: '
#Команды
#'

#if [[ $1 = "" ]];
#	then
#		echo "There is no filename in argument2"
#	else
#		echo "$1"
#fi

rm_file_string=$1 # Вводить можно только название файла. Находится нужно в этой же директории, где лежит файл. В названии не должно быть пути. В директории RECYCLE вводить нельзя.
touch ./$rm_file_string #для отладки, потом удалить
mv $rm_file_string $rec_dir
#echo $rm_file_string

temp1="$rec_dir""$rm_file_string"
gzip $temp1
temp1=""

#echo "Succeed in srm $rm_file_string"

#rm_file_string_2="$rm_file_string"".gz" #для отладки, потом удалить
#rm_file_string_2=${rm_file_string + ".gz"} #для отладки, потом удалить. Или так добавить окончание .gz. Чего-то не работает

temp1="$rec_dir""$rm_file_string"".gz"
rm $temp1 #для отладки, потом удалить
temp1=""

temp1="$rec_dir""temp_folder"
echo $temp1
touch $temp1
find $rec_dir -mtime +6 -fprint $temp1
while read line;
	do
		rm $line;
	done < $temp1
rm $temp1
temp1=""
