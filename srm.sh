#!/bin/bash
#
#rec_dir="~/RECYCLE"

echo " "
rm_file_string=$1 # вводить можно только название файла в которой находитесь. В названии не должно быть пути. В директории RECYCLE вводить нельзя.
touch ./$rm_file_string #для отладки, потом удалить
cp ./$rm_file_string ~/RECYCLE #cp заменить на mv
echo $rm_file_string
gzip ~/RECYCLE/$rm_file_string
echo "Succeed in srm "$rm_file_string""
rm ./$rm_file_string #для отладки, потом удалить
rm_file_string_2="$rm_file_string"".gz" #для отладки, потом удалить
rm ~/RECYCLE/$rm_file_string_2 #для отладки, потом удалить

