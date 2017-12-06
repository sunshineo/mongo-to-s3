# mongo-to-s3
Back up a mongo database to s3 (daily folder)
All args below are required
```
docker run --rm \
-e TZ=America/Los_Angeles \
-e MONGO_HOST=localhost \
-e MONGO_PORT=27017 \
-e MONGO_AUTH_DB=admin \
-e MONGO_USER=user \
-e MONGO_PASSWORD=password \
-e MONGO_DB_TO_BACKUP=mydb \
-e S3_BUCKET=my-bucket \
-e AWS_ACCESS_KEY_ID=my-access-key-id \
-e AWS_SECRET_ACCESS_KEY=my-secret \
sunshineo/mongo-to-s3
```
