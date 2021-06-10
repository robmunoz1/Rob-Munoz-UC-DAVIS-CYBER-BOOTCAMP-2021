#!/bin/bash




#./script dddd tt:tt:tt [am|pm] [B|R|T]


DATE=$1
TIME=$2
AM_PM=$3
GAME=$4

if [ "$GAME" == "B" ]
then
	first_col=3
	second_col=4
elif [ "$GAME" == "R" ]
then
	first_col=5
	second_col=6

else
       first_col=7
       second_col=8
fi


grep "$TIME $AM_PM" ${DATE}_Dealer_schedule | awk -v first=$first_col -v second=$second_col '{print $1, $2, $first, $second}'

