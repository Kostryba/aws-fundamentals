#! /bin/bash
echo "Creating AWS S3 Bucket"
aws s3api create-bucket --bucket final-kostryba-bucket --region us-east-1 --profile lohika
echo "Setting versioning to AWS S3 Bucket"
aws s3api put-bucket-versioning --bucket final-kostryba-bucket --versioning-configuration Status=Enabled --profile lohika
echo "Uploading calc-2021-0.0.1-SNAPSHOT.jar file to AWS S3 Bucket"
aws s3api put-object --bucket final-kostryba-bucket --key calc-2021-0.0.1-SNAPSHOT.jar --body calc-2021-0.0.1-SNAPSHOT.jar --profile lohika
echo "Uploading persist3-2021-0.0.1-SNAPSHOT.jar file to AWS S3 Bucket"
aws s3api put-object --bucket final-kostryba-bucket --key persist3-2021-0.0.1-SNAPSHOT.jar --body persist3-2021-0.0.1-SNAPSHOT.jar --profile lohika
