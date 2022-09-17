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



column1_background=$(cat config.conf | grep column1_back | sed 's/column1_background=//')
column1_font_color=$(cat config.conf | grep column1_font | sed 's/column1_font_color=//')
column2_background=$(cat config.conf | grep column2_back | sed 's/column2_background=//')
column2_font_color=$(cat config.conf | grep column2_font | sed 's/column2_font_color=//')

case $column1_background in
	1) COLUMN_1_B=$WHITE_B
	   	C1B_PRINT="Column 1 background = 1 (white)"
		COLUMN_1_BB=1;;
	2) COLUMN_1_B=$RED_B
		C1B_PRINT="Column 1 background = 2 (red)"
		COLUMN_1_BB=2;;
	3) COLUMN_1_B=$GREEN_B
		C1B_PRINT="Column 1 background = 3 (green)"
		COLUMN_1_BB=3;;
	4) COLUMN_1_B=$BLUE_B
		C1B_PRINT="Column 1 background = 4 (blue)"
		COLUMN_1_BB=4;;
	5) COLUMN_1_B=$PURPLE_B
		C1B_PRINT="Column 1 background = 5 (purple)"
		COLUMN_1_BB=5;;
	6) COLUMN_1_B=$BLACK_B
		C1B_PRINT="Column 1 background = 6 (black)"
		COLUMN_1_BB=6;;
	"") COLUMN_1_B=$WHITE_B
	   	C1B_PRINT="Column 1 background = default (white)"
		COLUMN_1_BB=1;;
esac

case $column1_font_color in
	1) COLUMN_1_S=$WHITE_S
		C1S_PRINT="Column 1 font color = 1 (white)"
		COLUMN_1_SS=1;;
	2) COLUMN_1_S=$RED_S
		C1S_PRINT="Column 1 font color = 2 (red)"
		COLUMN_1_SS=2;;
	3) COLUMN_1_S=$GREEN_S
		C1S_PRINT="Column 1 font color = 3 (green)"
		COLUMN_1_SS=3;;
	4) COLUMN_1_S=$BLUE_S
		C1S_PRINT="Column 1 font color = 4 (blue)"
		COLUMN_1_SS=4;;
	5) COLUMN_1_S=$PURPLE_S
		C1S_PRINT="Column 1 font color = 5 (purple)"
		COLUMN_1_SS=5;;
	6) COLUMN_1_S=$BLACK_S
		C1S_PRINT="Column 1 font color = 6 (black)"
		COLUMN_1_SS=6;;
	"") COLUMN_1_S=$RED_S
                C1S_PRINT="Column 1 font color = default (red)"
		COLUMN_1_SS=2;;
esac

case $column2_background in
	1) COLUMN_2_B=$WHITE_B
		C2B_PRINT="Column 2 background = 1 (white)"
		COLUMN_2_BB=1;;
        2) COLUMN_2_B=$RED_B
		C2B_PRINT="Column 2 background = 2 (red)"
		COLUMN_2_BB=2;;
        3) COLUMN_2_B=$GREEN_B
		C2B_PRINT="Column 2 background = 3 (green)"
		COLUMN_2_BB=3;;
        4) COLUMN_2_B=$BLUE_B
		C2B_PRINT="Column 2 background = 4 (blue)"
		COLUMN_2_BB=4;;
        5) COLUMN_2_B=$PURPLE_B
		C2B_PRINT="Column 2 background = 5 (purple)"
		COLUMN_2_BB=5;;
        6) COLUMN_2_B=$BLACK_B
		C2B_PRINT="Column 2 background = 6 (black)"
		COLUMN_2_BB=6;;
	"") COLUMN_2_B=$GREEN_B
		C2B_PRINT="Column 2 background = default (green)"
		COLUMN_2_BB=3;;
esac

case $column2_font_color in
	1) COLUMN_2_S=$WHITE_S
                C2S_PRINT="Column 2 font color = 1 (white)"
		COLUMN_2_SS=1;;
        2) COLUMN_2_S=$RED_S
                C2S_PRINT="Column 2 font color = 2 (red)"
		COLUMN_2_SS=2;;
        3) COLUMN_2_S=$GREEN_S
                C2S_PRINT="Column 2 font color = 3 (green)"
		COLUMN_2_SS=3;;
        4) COLUMN_2_S=$BLUE_S
                C2S_PRINT="Column 2 font color = 4 (blue)"
		COLUMN_2_SS=4;;
        5) COLUMN_1_S=$PURPLE_S
                C2S_PRINT="Column 2 font color = 5 (purple)"
		COLUMN_2_SS=5;;
        6) COLUMN_2_S=$BLACK_S
                C2S_PRINT="Column 2 font color = 6 (black)"
		COLUMN_2_SS=6;;
        "") COLUMN_1_S=$RED_S
                C2S_PRINT="Column 2 font color = default (blue)"
		COLUMN_2_SS=4;;
esac

if  [[ $COLUMN_1_BB -eq $COLUMN_1_SS ]] || [[ $COLUMN_2_BB -eq $COLUMN_2_SS ]]
then
        echo "The first parameter must not be equal to the second, and also the third must not be equal to the fourth! Try again"
        exit
fi

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

echo ""
echo  "${C1B_PRINT}"
echo  "${C1S_PRINT}"
echo  "${C2B_PRINT}"
echo  "${C2S_PRINT}"




