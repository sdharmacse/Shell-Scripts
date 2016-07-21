#!/bin/sh
DAY=`/bin/date +%Y%m%d`
###Syntax 
#mysqldump --port=3306 -u username -h HOSTNAME/ IP -ppassword --routines databasename > /path/prod-.$DAY.sql

mysqldump --port=3306 -u root -h 10.172.69.11 -p#dharma@123 --routines teamsdev62 > /root/db-bk/teamsdev62-.$DAY.sql





find /root/db-bk/* -maxdepth 1 -type f -mtime +7 -delete


