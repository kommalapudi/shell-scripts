#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 failed."
        exit 1
    else
        echo "$2 succeeded."
    fi
}

dnf install nginx -y
VALIDATE $? "nginx"

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nodejs -y
VALIDATE $? "nodejs"