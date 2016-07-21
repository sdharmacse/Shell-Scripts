
#!/bin/sh
DAY=`/bin/date +%Y%m%d`

echo "What to Backup"
SRC="/opt/attribute6.2-GA2"

echo "Where to Backup"
DES="/root/Auto-bk-att6.2-prod"

TARLOCATION="/mnt/backups/attribute6.2-GA2$DAY.tar.gz"
REMOTEIP="10.172.144.11"
PORT="22"
REMOTESERVER_USERNAME="root"
EMAILSUBJECT="Liferay 6.2 Attribure Dev workspace backups on $DAY"
EMAIL_SUCCESS_TEXT="Backups of Liferay 6.2 Attribure Dev workspace $DAY SUCCESS"
EMAIL_FAILTED_TEXT="Backups of Liferay 6.2 Attribure Dev workspace on $DAY FAILED"


DB_EMAIL_SUBJECT="Sakai  server's  database  info size"
WORK_SPACE_SUBJECT=" Liferay 6.2 Producation remote copy size "



echo "Remove the Previoous Archive file in  location"
rm /mnt/backups/*.tar.gz
################ Notification of email when the process got failed####################
if [ "$?" = 0 ]
then
 echo "Removed previous tar.gz file  successful"

else
 echo "Issue while Removing preivous  tar.gz $DAY " | mail -s '$ Unable remove the previous tar.gz file' sdharmacse@gmail.com vasanthkumar19@yahoo.com

fi
#######################################################################################

echo "Archive the attribute6.2-GA2 file /mnt loocation"
sudo tar  -zvcf  $TARLOCATION $SRC
################ Notification of email when the process got failed ###################
if [ "$?" = 0 ]
then
 echo "Archived Backup directory as tar.gz file Successfully in /mnt"

else
 echo "Issue while Archiving the Backup directory $DAY tar.gz" | mail -s 'Unable to Archive the Backup directory as tar.gz file' sdharmacse@gmail.com vasanthkumar19@yahoo.com

fi
######################################################################################

echo "copy the tar file to remote server"
scp -r -P $PORT $TARLOCATION  $REMOTESERVER_USERNAME@$REMOTEIP:$DES
################ Notification of email when the process got failed ###################
if [ "$?" = 0 ]
then
 # echo "Remote Backup is successful"
 echo "$EMAIL_SUCCESS_TEXT" | mail -s "$EMAILSUBJECT" sdharmacse@gmail.com vasanthkumar19@yahoo.com

else
 echo "$EMAIL_FAILTED_TEXT" | mail -s "$EMAILSUBJECT" sdharmacse@gmail.com vasanthkumar19@yahoo.com

fi
####################################################################################################
############### Size of DB Server and work space with email notifications
ssh $REMOTEIP -l $REMOTESERVER_USERNAME -p $PORT du -hs /$REMOTESERVER_USERNAME/db-bk/*  | mail -s "$DB_EMAIL_SUBJECT"  sdharmacse@gmail.com vasanthkumar19@yahoo.com


ssh $REMOTEIP -l $REMOTESERVER_USERNAME -p $PORT du -hs $DES/* | mail -s "$WORK_SPACE_SUBJECT" sdharmacse@gmail.com vasanthkumar19@yahoo.com

