#!/bin/sh
DAY=`/bin/date +%Y%m%d`

###Syntax   find /path of  the file/* -maxdepth 1 -type f -mtime +7 -delete


find /hpme/dharmra/db-bk/* -maxdepth 1 -type f -mtime +7 -delete