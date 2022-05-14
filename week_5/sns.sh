#! /bin/bash
aws sns publish --topic-arn "arn:aws:sns:us-east-1:532442580831:week_4_sns" --message "Test message to SNS" --region us-east-1