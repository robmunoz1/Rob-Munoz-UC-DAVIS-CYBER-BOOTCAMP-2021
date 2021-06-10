#!/bin/bash

#./script dddd tt:tt:tt [AM|PM]

DATE=$1
TIME=$2
MORNING_EVENING=$3


grep "$TIME $MORNING_EVENING" ${DATE}_Dealer_schedule | awk '{print $1, $2, $5, $6}'  
