resource "aws_iam_role_policy" "sns_access_policy" {
  name = "sns_access_policy"
  role = aws_iam_role.ec2_week_4_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "sns:Publish"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:sns:us-east-1:532442580831:week_4_sns"
      }
    ]
  })
}

resource "aws_iam_role_policy" "sqs_access_policy" {
  name = "sqs_access_policy"
  role = aws_iam_role.ec2_week_4_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "sqs:SendMessage",
          "sqs:ReceiveMessage"
        ],
        "Effect" : "Allow",
        "Resource" : "arn:aws:sqs:us-east-1:532442580831:week_4_queue"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_week_4_access_role.name
}

resource "aws_iam_role" "ec2_week_4_access_role" {
  name = "ec2_week_4_access_role"

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