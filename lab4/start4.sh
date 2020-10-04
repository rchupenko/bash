#!/bin/bash
if [ $# -ne 2 ]
then 
echo "Некорректное количество агрементов"
echo "введите:"
echo $0 " [url#1] [url#2]"
else
for p in 1 2 3 ; do ping $1 > /dev/null & done
for i in 1 2 ; do ping $2 > /dev/null & done
fi