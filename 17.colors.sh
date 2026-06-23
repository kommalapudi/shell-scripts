#!/bin/bash

#for i in {1..5}; do
#    echo "Iteration $i"
#done

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripts"
LOGS_FILE="$LOGS_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ "$USERID" -ne 0 ]; then
    echo -e "$R Please run as root $N" | tee -a "$LOGS_FILE"
    exit 1
fi

mkdir -p "$LOGS_FOLDER"

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R$2... failed.$N" | tee -a "$LOGS_FILE"
        exit 1
    else
        echo -e "$2...$G succeeded.$Y" | tee -a "$LOGS_FILE"
    fi
}

for package in $@; do   # sudo sh 14-loops.sh nginx mysql nodejs
    dnf list installed "$package" -y &>> "$LOGS_FILE"
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install "$package" -y &>> "$LOGS_FILE"
        VALIDATE $? "$package installation"
    else
        echo -e "$package already installed... $Y skipping $N"
    fi
done