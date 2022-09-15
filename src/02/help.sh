#!/bin/bash

echo HOSTNAME = $(cat /etc/hostname)
echo TIMEZONE = $(timedatectl | grep Time)
echo USER = $USER
echo OS = $(hostnamectl | grep Operat)
echo DATE = $(date +%e" "%B" "%T)
echo UPTIME =  $(uptime -p)
echo UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}')
echo IP = $(hostname -I | awk '{print $1}')
echo MASK = $(ifconfig | grep -A1 -e "[1-5]: " | grep "netmask" |awk '{print $4}' | sort -n -k10)
echo GATEWAY = $(ip r | grep default | awk '{print $3}')
echo RAM_TOTAL = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$2/1024'})
echo RAM_USED = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$3/1024'})
echo RAM_FREE = $(free -h | grep Mem | awk  '{printf "%.3f GB" ,$4/1024'})
echo SPACE_ROOT = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$2*1024'})
echo SPACE_ROOT_USED = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$3*1024'})
echo SPACE_ROOT_FREE = $(df -h /root | grep / | awk  '{printf "%.2f MB" ,$4*1024'})
