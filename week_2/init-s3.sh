#! /bin/bash
echo "Creating file example"
touch testfile.txt
echo "Creating AWS S3 Bucket"
aws s3api create-bucket --bucket week-2-bucket --region us-east-1 --profile lohika
echo "Setting versioning to AWS S3 Bucket"
aws s3api put-bucket-versioning --bucket week-2-bucket --versioning-configuration Status=Enabled --profile lohika
echo "Uploading file to AWS S3 Bucket"
aws s3api put-object --bucket week-2-bucket --key testfile.txt --body testfile.txt --profile lohika
