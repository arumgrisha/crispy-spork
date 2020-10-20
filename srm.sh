#!/bin/bash

REC_DIR=~/RECYCLE/ #Определяем местоположение корзины. На конце слэш!
if test -z $1; #Проверяем получение аргумента (названия файла)
	then
		echo "There is no filename in argument";
		return #Выходим из функции
	else
		echo "Safe removing: $1"
fi

if test -d $REC_DIR; #Проверяем существование корзины
	then
		echo "~/RECYCLE exists"
	else
		echo "Creating ~/RECYCLE";
		mkdir $REC_DIR
		return #Выходим из функции
fi

RM_FILE_STRING=$1 # Вводить можно только название файла. Находится нужно в этой же директории, где лежит файл. В названии не должно быть пути. В директории RECYCLE вводить нельзя.
mv $RM_FILE_STRING $REC_DIR
TEMP1="$REC_DIR""$RM_FILE_STRING"
gzip $TEMP1
TEMP1=""

TEMP1="$REC_DIR""TEMP_folder"
touch $TEMP1
find $REC_DIR -mtime +6 -fprint $TEMP1
while read line;
	do
		rm $line;
	done < $TEMP1
rm $TEMP1
TEMP1=""
