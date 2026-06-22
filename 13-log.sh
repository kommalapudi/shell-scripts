#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripts"
LOGS_FILE="/var/log/shell-scripts/$0.log"

if [ $USERID -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 failed."
        exit 1
    else
        echo "$2 succeeded."
    fi
}

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "nginx"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "mysql"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs"