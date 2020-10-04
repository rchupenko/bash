#!/bin/bash
# тест
if [ $# -ne 2 ]
then 
echo "Не корректное количество агрументов"
echo "Введите:"
echo $0 "[URL#1] [URL#2]"
else
echo "ping по адресу $1"
pgrep -f $1 | wc -l
echo "ping по адресу $2"
pgrep -f $2 | wc -l
fi 