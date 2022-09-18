#!/bin/bash

START=$(date +%s)


count_folders=$(du $1 | grep -c "$1")
count_files=$(find $1 -type f | grep -c $1)
count_exe_files=$(find $1 -type f -perm /001 | grep -c $1)

echo "Total number of folders (including all nested ones) = $count_folders"
echo "TOP 5 folders of maximum size arranged in descended order (path and size):"

if [ $count_folders -gt 5 ]
then
    count_folders=5
fi

for (( i=1; i < count_folders; i++ ))
do
    echo $i - $(du $1 -h | sort -hr | sed -n "$i"p | awk '{print $2", "$1}')
done

echo "Total number of file = $count_files"
echo "Number of:"
echo "Configuration files = $(find $1 | grep -c "\.conf")"
echo "Text files = $(find $1 -type f | grep -c -e "\.txt" -c -e "\.text")"
echo "Executable files = $count_exe_files"
echo "Log files (with the extension .log) = $(find $1 -type f | grep -c "\.log")"
echo "Archve files  = $(find $1 | grep -c -e "\.rar" -e "\.tar" -e "\.zip")"
echo "Symbolic links = $(find $1 -type l | grep -c $1)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

if [ $count_files -gt 10  ]
then
    count_files=10
fi

for (( i=1; i <= count_files; i++ ))
do
    echo "$i - $(find $1 -type f -ls | sort -nrk7 | sed -n "$i"p | awk '{printf "%s %.3f", $11, $7/1024}') MB, $(find $1 -type f -ls | sort -nrk7 | sed -n "$i"p | sed "s/.*\.//")"
done

if [ $count_exe_files -gt 10 ]
then
    count_exe_files=10
fi

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"

for (( i=1; i <= count_exe_files; i++ ))
do
    echo "$i - $(find $1  -type f -perm /001 -ls | sort -nrk7 | sed -n "$i"p | awk '{printf "%s %.3f", $11, $7/1024}') MB $(find $1  -type f -perm /001 -ls | sort -nrk7 | sed -n "$i"p | awk '{print $11}' | md5sum | awk '{print $1}')"
done

END=$(date +%s)
WORKTIME=$(($END - $START))
echo "Script execution time (in second) =  $WORKTIME"

