#! /bin/bash
aws dynamodb list-tables --region us-east-1
echo "put (key = '1'; value = 'Alex')"
aws dynamodb put-item --table-name "dynamodb-customers" --item '{ "id": { "S": "1" }, "Value": { "S": "Alex" } }' --region us-east-1
echo "put (key = '2'; value = 'Bob')"
aws dynamodb put-item --table-name "dynamodb-customers" --item '{ "id": { "S": "2" }, "Value": { "S": "Bob" } }' --region us-east-1

echo "Get item with key = '1'"
aws dynamodb get-item --table-name "dynamodb-customers" --key '{ "id": { "S": "1" } }' --region us-east-1
echo "Get item with key = '2'"
aws dynamodb get-item --table-name "dynamodb-customers" --key '{ "id": { "S": "2" } }' --region us-east-1
