#!/bin/bash

START=$(date +%s)


count_folders=$(du $1 | grep -c "$1")
echo "Total number of folders (including all nested ones) = $count_folders"
echo "TOP 5 folders of maximum size arranged in descended order (path and size):"

if [ $count_folders -gt 5 ]
then
    count_folders=5
fi

for (( i=1; i < count_folders; i++ ))
do
    echo $i - $(du $1 -h | sort -hr | sed -n "$i"p | awk '{print $2" "$1}')
done

echo "Total number of file = $(find $1 -type f | grep -c $1)"
echo "Number of:"
echo "Configuration files = $(find $1 | grep -c "\.conf")"
echo "Text files = $(find $1 -type f | grep -c -e "\.txt" -c -e "\.text")"
echo "Executable files = $(find $1 -type f -perm /001 | wc -l)"
echo "Log files (with the extension .log) = $(find $1 -type f | grep -c "\.log")"
echo "Archve files  = $(find $1 | grep -c -e "\.rar" -e "\.tar" -e "\.zip")"
echo "Symbolic links = $(find $1 -type l | wc -l)"

END=$(date +%s)
WORKTIME=$(($END - $START))
echo "Script execution time (in second) = $WORKTIME"
