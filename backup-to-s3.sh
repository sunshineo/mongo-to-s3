#!/bin/sh
mongodump --host $MONGO_HOST --port $MONGO_PORT --authenticationDatabase $MONGO_AUTH_DB -u $MONGO_USER -p $MONGO_PASSWORD -d heroku_cqtxz92f

YEAR=`date '+%Y'`
MONTH=`date '+%m'`
DAY=`date '+%d'`

S3_FOLDER="s3://$S3_BUCKET/$YEAR/$MONTH/$DAY"
echo "Upload to $S3_FOLDER"

#export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
#export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"

aws s3 sync ./dump $S3_FOLDER
