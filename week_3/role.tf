resource "aws_iam_role_policy" "s3_get_object_access_policy" {
  name = "s3_get_object_access_policy"
  role = aws_iam_role.ec2_week_3_access_role.id

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
  role = aws_iam_role.ec2_week_3_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "SpecificTable",
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:ListTables",
          "dynamodb:GetItem",
          "dynamodb:PutItem"
        ],
        "Resource" : "arn:aws:dynamodb:*:*:table/*"
      }
    ]
  })
}

resource "aws_iam_role_policy" "rds_access_policy" {
  name = "rds_access_policy"
  role = aws_iam_role.ec2_week_3_access_role.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "SpecificTable",
        "Effect" : "Allow",
        "Action" : [
          "rds-db:connect"
        ],
        "Resource" : "arn:aws:rds-db:us-east-1:532442580831:dbuser:db-3I4OX7ELYSQ276ZAAT3Z6JUC3U/week3user"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_week_3_access_role.name
}

resource "aws_iam_role" "ec2_week_3_access_role" {
  name = "ec2_week_3_access_role"

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