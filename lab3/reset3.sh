#!/bin/bash
#скрипт удалени файлов, групп и пользователей
if [ $# -ne 5 ]
then 
echo "Не корректное количество параметров!"
echo "Для корректной работы скрипта введите:"
echo $0 "[имя группы 1] [имя группы 2] [имя пользователя 1] [имя пользователя 2] [имя пользователя 3]"
else
#удаление каталогов и файлов
rm -rf /srv/dir1
rm -rf /srv/dir2
#удаление групп и пользователей
groupdel $1
groupdel $2
userdel -r $3
userdel -r $4
userdel -r $5
fi
