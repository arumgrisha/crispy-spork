# Скрипт (Bash). Безопасное удаление файлов. #

Входным параметром скрипта является название файла в директории, в которой вы находитесь в данный момент. Вводить можно только имя без пути и дополнительных знаков.


Переданный в аргумент функции файл архивируется и перемещается в ~/RECYCLE . При каждом запуске скрипта файлы старше 7 дней удаляются.

# Установка скрипта #

Помещаем файл *srm.sh* в *~/bin*.  
Открываем файл *~/.bash_profile* и дописываем *export PATH="${PATH}:~/bin"* .

# Использование скрипта #

*$srm.sh* пробел *название файла в директории нахождения*
