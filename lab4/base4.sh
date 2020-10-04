#!/bin/bash
# лабораторная работа № 4
# сценарий моениторинга запущенных процессов
for p in `pgrep -f ya.ru`
do
kill $p
done
for p in `pgrep -f yandex.ru`
do
kill $p
done
