#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

echo "Installing nginx web server..."
dnf install nginx -y

if [ $? -eq 0 ]; then
  echo "nginx installed successfully."
else
  echo "Failed to install nginx."
  exit 1
fi

dnf install mysql -y
if [ $? -eq 0 ]; then
  echo "mysql installed successfully."
else
  echo "Failed to install mysql."
  exit 1
fi

dnf install nodejs -y
if [ $? -eq 0 ]; then
  echo "nodejs installed successfully."
else
  echo "Failed to install nodejs."
  exit 1
fi