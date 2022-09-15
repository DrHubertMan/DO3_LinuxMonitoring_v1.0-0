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

END="\033[0m" 

f_column_s=WHITE_B
f_column_b= 

s_column_s= 
s_column_b=
echo -e "${f_column_s}HOSTNAME${END} = $(cat /etc/hostname)${END}"
echo -e "TIMEZONE${END} = $(timedatectl | grep Time)${END}"
echo -e "USER${END} = $USER${END}"
echo -e "OS${END} = $(hostnamectl | grep Operat)${END}"
echo -e "DATE${END} = $(date +%e" "%B" "%T)${END}"
echo -e "UPTIME ${END}=  $(uptime -p)${END}"
echo -e "UPTIME_SEC${END} = $(cat /proc/uptime | awk '{print $1}')${END}"
echo -e "IP${END} = $(hostname -I | awk '{print $1}')${END}"
echo -e "MASK${END} = $(ifconfig | grep -A1 -e "[1-5]: " | grep "netmask" |awk '{print $4}' | sort -n -k10)${END}"
echo -e "GATEWAY${END} = $(ip r | grep default | awk '{print $3}')${END}"
echo -e "RAM_TOTAL${END} = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$2/1024'})${END}"
echo -e "RAM_USED${END} = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$3/1024'})${END}"
echo -e "RAM_FREE${END} = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$4/1024'})${END}"
echo -e "SPACE_ROOT${END} = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$2*1024'})${END}"
echo -e "SPACE_ROOT_USED${END} = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$3*1024'})${END}"
echo -e "SPACE_ROOT_FREE${END} = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$4*1024'})${END}"
