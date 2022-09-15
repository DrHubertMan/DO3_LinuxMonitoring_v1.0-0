#!/bin/bash

./help.sh

echo "Do you want to save data? (Y/n) "

read reply

if [[ $reply =~ [yY] ]]
then 
	./help.sh > $(date +"%d_%m_%y_%H_%M_%S.status")
fi	
