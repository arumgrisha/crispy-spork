#!/bin/bash
#
REC_DIR=~/RECYCLE/ #Определяем местоположение корзины
if test -z $1; #Проверяем получение аргумента (названия файла)
	then
		echo "There is no filename in argument";
		return #Выходим из функции
	else
		echo "Safe removing: $1"
fi

#echo $REC_DIR

if test -d $REC_DIR; #Проверяем существование корзины
	then
		echo "~/RECYCLE exists"
	else
		echo "Creating ~/RECYCLE";
		mkdir $REC_DIR
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

RM_FILE_STRING=$1 # Вводить можно только название файла. Находится нужно в этой же директории, где лежит файл. В названии не должно быть пути. В директории RECYCLE вводить нельзя.
#touch ./$RM_FILE_STRING #для отладки, потом удалить
mv $RM_FILE_STRING $REC_DIR
#echo $RM_FILE_STRING

TEMP1="$REC_DIR""$RM_FILE_STRING"
gzip $TEMP1
TEMP1=""

#echo "Succeed in srm $RM_FILE_STRING"

#RM_FILE_STRING_2="$RM_FILE_STRING"".gz" #для отладки, потом удалить
#RM_FILE_STRING_2=${RM_FILE_STRING + ".gz"} #для отладки, потом удалить. Или так добавить окончание .gz. Чего-то не работает

TEMP1="$REC_DIR""$RM_FILE_STRING"".gz"
#rm $TEMP1 #для отладки, потом удалить
TEMP1=""

TEMP1="$REC_DIR""TEMP_folder"
#echo $TEMP1
touch $TEMP1
find $REC_DIR -mtime +6 -fprint $TEMP1

#find $REC_DIR -true -fprint $TEMP1 #удалить потом

while read line;
	do
		rm $line;
	done < $TEMP1
rm $TEMP1
TEMP1=""
