#!/bin/bash

echo "back up started"

HOME=/home/ubuntu
export HOME

# Constants
USER=""
PWD=""
DATABASE=""
HOST=""

# Date stamp (formated YYYYMMDD)
CURRENT_DATE=$(date "+%Y%m%d")

# Create the backup
pg_dump postgresql://$USER:$PWD@$HOST:5432/$DATABASE > $CURRENT_DATE.bak
echo "backup file generated!"

# zip it
gzip $CURRENT_DATE.bak
echo "zipped"

# Upload to cloud
aws s3 cp $CURRENT_DATE.bak.gz s3://bucket-name/$CURRENT_DATE.bak.gz

#remove zip
rm -rf $CURRENT_DATE.bak.gz

unset HOME

echo "backup finished"
