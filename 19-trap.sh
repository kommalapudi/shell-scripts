#!/bin/bash

set -e #ERR
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR
#trap 'echo "Error: Script failed at line $LINENO with exit code $?"' ERR
echo "hello world"
echo " I am learning Linux"
echoo "This is a typo, it will cause an error and exit the script"
echo "This will not be printed because of the error above"