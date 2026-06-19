#!/bin/bash
##### special variables in bash #####

echo "All arguments passed to the script: $@"
echo "Number of arguments passed to the script: $#"
echo "Script name: $0"
echo "present directory: $PWD"
echo "who is running the script: $USER"
echo "home directory: $HOME"
echo "PID of the current script: $$"
sleep 10 &
echo "All args passed to the script: $*"