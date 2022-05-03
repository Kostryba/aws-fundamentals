resource "aws_instance" "app_server" {
  ami                    = var.image_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.http_and_ssh_group.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  user_data              = <<EOF
  		#! /bin/bash
  	   sudo amazon-linux-extras install postgresql13
       aws s3api get-object --bucket week-3-kostryba-bucket --key rds-script.sql rds-script.sql
       aws s3api get-object --bucket week-3-kostryba-bucket --key dynamodb-script.sh dynamodb-script.sh
  	EOF

  key_name = "okostryba_lohika_ssh"

  tags = {
    Name = var.ec2_instance_name
  }
}

