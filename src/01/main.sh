#!/bin/bash

var1=$1
check=`echo "$1" | grep -E ^\[-+]?[0-9]*\.?[0-9]+$`

if [ "$check" != '' ] 
then
        echo "it is a number"
else
        echo $var1
fi

