#! /bin/bash
aws sqs send-message --queue-url https://sqs.us-east-1.amazonaws.com/532442580831/week_4_queue --message-body "Test message to SQS" --region us-east-1

aws sqs receive-message --queue-url https://sqs.us-east-1.amazonaws.com/532442580831/week_4_queue --region us-east-1
