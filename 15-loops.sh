#!/bin/bash

#for i in {1..5}; do
#    echo "Iteration $i"
#done

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripts"
LOGS_FILE="$LOGS_FOLDER/$0.log"

if [ "$USERID" -ne 0 ]; then
    echo "Please run as root" | tee -a "$LOGS_FILE"
    exit 1
fi

mkdir -p "$LOGS_FOLDER"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 failed." | tee -a "$LOGS_FILE"
        exit 1
    else
        echo "$2 succeeded." | tee -a "$LOGS_FILE"
    fi
}

for package in $@; do   # sudo sh 14-loops.sh nginx mysql nodejs
    dnf list installed "$package" -y &>> "$LOGS_FILE"
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install "$package" -y &>> "$LOGS_FILE"
        VALIDATE $? "$package installation"
    else
        echo "$package already installed, skipping installation"
    fi
    VALIDATE $? "$package"
done