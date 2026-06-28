#!/bin/bash

COUNTRY=INDIA

echo "I am in: $COUNTRY"
echo "PID of SCRIPT-1: $$"

sh 22-script2.sh
source 22-script2.sh

#note:
#sh script-2.sh -> seperate process, cant access the script-1 variables
#source script-2.sh -> same process, can access the script-1 variables