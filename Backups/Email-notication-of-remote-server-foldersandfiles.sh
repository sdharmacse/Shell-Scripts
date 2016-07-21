#!/bin/sh
DAY=`/bin/date +%Y%m%d`

REMOTEIP="10.172.144.11"
PORT="22"
REMOTESERVER_USERNAME="root"
EMAILSUBJECT="Liferay 6.2 Attribure Dev workspace backups on $DAY"
EMAIL_SUCCESS_TEXT="Backups of Liferay 6.2 Attribure Dev workspace $DAY SUCCESS"
EMAIL_FAILTED_TEXT="Backups of Liferay 6.2 Attribure Dev workspace on $DAY FAILED"
DB_EMAIL_SUBJECT="Sakai  server's  database  info size"
WORK_SPACE_SUBJECT=" Liferay 6.2 Producation remote copy size "



####################################################################################################
############### Size of DB Server and work space with email notifications
ssh $REMOTEIP -l $REMOTESERVER_USERNAME -p $PORT du -hs /$REMOTESERVER_USERNAME/db-bk/*  | mail -s "$DB_EMAIL_SUBJECT"  sdharmacse@gmail.com vasanthkumar19@yahoo.com


ssh $REMOTEIP -l $REMOTESERVER_USERNAME -p $PORT du -hs $DES/* | mail -s "$WORK_SPACE_SUBJECT" sdharmacse@gmail.com vasanthkumar19@yahoo.com