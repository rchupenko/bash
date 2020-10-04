�#!/bin/bash
# лабораторная работа №3 - создание групп и пользователей
#проверка корректности введения параметров
if [ $# -ne 5 ]
then  
echo "Не верное количество параметров!"
echo "Для корректного запуска скрипта введите:"
echo $0 "[имя группы 1] [имя группы 2] [имя пользователя 1] [имя пользователя 2] [имя пользователя 2]"
else
echo "Параметры введены верно." 
#echo "Список параметров:"  $@
#создание групп
groupadd $1
groupadd $2
#создание пользователей
adduser $3
adduser $4
adduser $5
#добавляем пользователей в группы
gpasswd -a user1 group1
gpasswd -a user2 group1
gpasswd -a user2 group2
gpasswd -a user3 group2
#выведем информацию о пользователях
for i in `seq 3 5`
do
echo cat  "пользователь $i"
id $i
done
#создаем каталоги
mkdir /srv/dir1 
mkdir /srv/dir2
#отдаем каталоги в соответствующие группы
chgrp $1 /srv/dir1
chgrp $2 /srv/dir2
#выдаем права на запись в каталоги
chmod 2775 /srv/dir1
chmod 2775 /srv/dir2
ls -la /srv
fi
