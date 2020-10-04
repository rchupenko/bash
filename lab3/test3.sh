#!/bin/bash
#скрипт проверки прав пользователей
#проверка корректности ввода параметров
if [ $# -ne 3 ] 
then 
echo "введено не верное количество параметров"
echo "для корректной работ скрипта введите:"
echo $0 "[имя пользователя 1] [имя пользователя 2] [имя пользователя 3]"
else
echo "количество параметров введно верно"
#второй пользователь создает файлы
su -l $2 -c '
cd /srv/dir1
touch file_u2d1
whoami && echo "создал(а) файл file_u2d1 в каталоге" && pwd
cd /srv/dir2
touch file_u2d2
echo "`whoami` создал(а) файл file_u2d2 в каталоге `pwd`" '
#первый пользователь - доступ к файлам dir1
su -l $1 -c '
cd /srv/dir1
whoami && echo "пытается создать файл file_u1d1 в каталоге" && pwd
mv /srv/dir1/file_u2d1 /srv/dir1/file_u1d1
echo $?
#первый пользователь доступ к файлам в dir2
cd /srv/dir2
echo "`whoami` пытается создать файл file_u1d2 в каталоге `pwd`"
mv /srv/dir2/file_u2d2 /srv/dir2/file_u1d2
echo $? '
#третий пользователь - доступ к файлам dir1
su -l $3 -c '
cd /srv/dir1
whoami && echo "пытается создать файл file_u3d1 в каталоге" && pwd
mv /srv/dir1/file_u2d1 /srv/dir1/file_u3d1
echo $?
#третий пользователь доступ к файлам в dir2
cd /srv/dir2
echo "`whoami` пытается создать файл file_u3d2 в каталоге `pwd`"
mv /srv/dir2/file_u2d2 /srv/dir2/file_u3d2
echo $? '
fi

