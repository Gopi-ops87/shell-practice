#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with root privelege"
   exit 1; #failure is other than 0
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2... $R is failure $N"
        exit 1;
    else
        echo "Installing $2..... $G is success $N"
    fi
}

dnf list installed mysql  
# Install if it is not found
if [$? -ne 0]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySql already exist ... $G skipping $N"
fi

dnf list installed nginx 
# Install if it is not found
if [$? -ne 0]; then
   dnf install nginx -y
   VALIDATE $? "Nginx"
else
    echo "nginx already exist ... $G skipping $N"
fi

dnf list installed python3 
# Install if it is not found
if [$? -ne 0]; then
   dnf install python3 -y
   VALIDATE $? "Python3"
else
    echo "Python3 already exist ... $G skipping $N"
fi
