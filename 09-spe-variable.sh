#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "ho is running it: $USER"
echo "user home directory: $HOME"
echo "PID of the script: $$"
sleep 50 &
echo "PID of the last command used: $!"