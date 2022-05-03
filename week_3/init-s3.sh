#! /bin/bash
echo "Creating AWS S3 Bucket"
aws s3api create-bucket --bucket week-3-kostryba-bucket --region us-east-1 --profile lohika
echo "Setting versioning to AWS S3 Bucket"
aws s3api put-bucket-versioning --bucket week-3-kostryba-bucket --versioning-configuration Status=Enabled --profile lohika
echo "Uploading rds script to AWS S3 Bucket"
aws s3api put-object --bucket week-3-kostryba-bucket --key rds-script.sql --body rds-script.sql --profile lohika
echo "Uploading dynamodb script to AWS S3 Bucket"
aws s3api put-object --bucket week-3-kostryba-bucket --key dynamodb-script.sh --body dynamodb-script.sh --profile lohika