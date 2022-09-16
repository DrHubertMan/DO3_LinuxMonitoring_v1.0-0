#!/bin/bash


WHITE_S="\033[37m" 
WHITE_B="\033[47m"

RED_S="\033[31m"
RED_B="\033[41m"

GREEN_S="\033[32m"
GREEN_B="\033[42m"

BLUE_S="\033[34m"
BLUE_B="\033[44m"

PURPLE_S="\033[35m"
PURPLE_B="\033[45m"

BLACK_S="\033[30m"
BLACK_B="\033[40m"

END="\033[0;39m"

if [[ $1 -eq $2 ]] || [[ $3 -eq $4 ]]
then
	echo "The first parameter must not be equal to the second, and also the third must not be equal to the fourth! Try again"
	exit
fi

case $1 in
	1) COLUMN_1_B=$WHITE_B;;
	2) COLUMN_1_B=$RED_B;;
	3) COLUMN_1_B=$GREEN_B;;
	4) COLUMN_1_B=$BLUE_B;;
	5) COLUMN_1_B=$PURPLE_B;;
	6) COLUMN_1_B=$BLACK_B;;
esac

case $2 in
	1) COLUMN_1_S=$WHITE_S;;
	2) COLUMN_1_S=$RED_S;;
	3) COLUMN_1_S=$GREEN_S;;
	4) COLUMN_1_S=$BLUE_S;;
	5) COLUMN_1_S=$PURPLE_S;;
	6) COLUMN_1_S=$BLACK_S;;
esac

case $3 in
	1) COLUMN_2_B=$WHITE_B;;
        2) COLUMN_2_B=$RED_B;;
        3) COLUMN_2_B=$GREEN_B;;
        4) COLUMN_2_B=$BLUE_B;;
        5) COLUMN_2_B=$PURPLE_B;;
        6) COLUMN_2_B=$BLACK_B;;
esac

case $4 in
	1) COLUMN_2_S=$WHITE_S;;
        2) COLUMN_2_S=$RED_S;;
        3) COLUMN_2_S=$GREEN_S;;
        4) COLUMN_2_S=$BLUE_S;;
        5) COLUMN_2_S=$PURPLE_S;;
        6) COLUMN_2_S=$BLACK_S;;
esac


echo -e "${COLUMN_1_B}${COLUMN_1_S}HOSTNAME${END} = ${COLUMN_2_B}${COLUMN_2_S}$(cat /etc/hostname)${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}TIMEZONE${END} = ${COLUMN_2_B}${COLUMN_2_S}$(timedatectl | grep Time | awk '{print $3" "$4" "$5}')${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}USER${END} = ${COLUMN_2_B}${COLUMN_2_S}$USER${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}OS${END} = ${COLUMN_2_B}${COLUMN_2_S}$(hostnamectl | grep Operat)${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}DATE${END} = ${COLUMN_2_B}${COLUMN_2_S}$(date +%e" "%B" "%T)${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}UPTIME${END} =  ${COLUMN_2_B}${COLUMN_2_S}$(uptime -p)${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}UPTIME_SEC${END} = ${COLUMN_2_B}${COLUMN_2_S}$(cat /proc/uptime | awk '{print $1}')${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}IP${END} = ${COLUMN_2_B}${COLUMN_2_S}$(hostname -I | awk '{print $1}')${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}MASK${END} = ${COLUMN_2_B}${COLUMN_2_S}$(ifconfig | grep -A1 -e "[1-5]: " | grep "netmask" |awk '{print $4}' | sort -n -k10)${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}GATEWAY${END} = ${COLUMN_2_B}${COLUMN_2_S}$(ip r | grep default | awk '{print $3}')${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}RAM_TOTAL${END} = ${COLUMN_2_B}${COLUMN_2_S}$(free -h | grep Mem | awk  '{printf "%.3f GB" ,$2/1024'})${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}RAM_USED${END} = ${COLUMN_2_B}${COLUMN_2_S}$(free -h | grep Mem | awk  '{printf "%.3f GB" ,$3/1024'})${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}RAM_FREE${END} = ${COLUMN_2_B}${COLUMN_2_S}$(free -h | grep Mem | awk  '{printf "%.3f GB" ,$4/1024'})${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}SPACE_ROOT${END} = ${COLUMN_2_B}${COLUMN_2_S}$(df -h /root | grep / | awk  '{printf "%.2f MB" ,$2*1024'})${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}SPACE_ROOT_USED${END} = ${COLUMN_2_B}${COLUMN_2_S}$(df -h /root | grep / | awk  '{printf "%.2f MB" ,$3*1024'})${END}"
echo -e "${COLUMN_1_B}${COLUMN_1_S}SPACE_ROOT_FREE${END} = ${COLUMN_2_B}${COLUMN_2_S}$(df -h /root | grep / | awk  '{printf "%.2f MB" ,$4*1024'})${END}"                                                                 	
