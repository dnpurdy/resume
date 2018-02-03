#!/bin/bash 
#set -e

RES_DIR="/tmp/resume"

cd $RES_DIR

for FILE in $(find . -type f); do
	echo $FILE
	ODIR=$(dirname $FILE)
	lftp -e "set ftp:ssl-allow no; set ssl:verify-certificate no; cd public_html; put -O $ODIR $FILE; quit;" davidpurdy.net
done
