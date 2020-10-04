#!/bin/bash
#сценарий очистки
if [ $# -ne 2 ]
then
echo "некорректное количество агрументов, введите:"
echo $0 "[URL#1] [URL#2]"
else
for p in `pgrep -f $1`
do
kill $p
done
for p in `pgrep -f $2`
do
kill $p
done 
fi 