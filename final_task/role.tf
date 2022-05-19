resource "aws_iam_role_policy" "sns_access_policy" {
  name = "sns_access_policy"
  role = aws_iam_role.ec2_final_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "sns:Publish",
          "sns:CreateTopic"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:sns:us-east-1:532442580831:edu-lohika-training-aws-sns-topic"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sqs_access_policy" {
  name = "sqs_access_policy"
  role = aws_iam_role.ec2_final_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:GetQueueUrl"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:sqs:us-east-1:532442580831:edu-lohika-training-aws-sqs-queue"
      }
    ]
  })
}

resource "aws_iam_role_policy" "s3_get_object_access_policy" {
  name = "s3_get_object_access_policy"
  role = aws_iam_role.ec2_final_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "s3:GetObject"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "dynamodb_access_policy" {
  name = "dynamodb_access_policy"
  role = aws_iam_role.ec2_final_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "SpecificTable",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:*"
        ],
        "Resource" : "arn:aws:dynamodb:us-east-1:532442580831:table/*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "rds_access_policy" {
  name = "rds_access_policy"
  role = aws_iam_role.ec2_final_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "SpecificTable",
        "Effect" : "Allow",
        "Action" : [
          "rds-db:*"
        ],
        "Resource" : "arn:aws:rds-db:us-east-1:532442580831:dbuser:*/*"
      }
    ]
  })
}

resource "aws_iam_role" "ec2_final_access_role" {
  name = "ec2_final_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "just some tag"
  }
}

resource "aws_iam_instance_profile" "final_ec2_profile" {
  name = "final_ec2_profile"
  role = aws_iam_role.ec2_final_access_role.name
}



