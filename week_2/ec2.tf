variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

resource "aws_instance" "app_server" {
  ami                    = var.image_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.http_and_ssh_group.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  user_data              = <<EOF
  		#! /bin/bash
       aws s3api get-object --bucket week-2-bucket --key testfile.txt testfile.txt
  	EOF

  key_name = "okostryba_lohika_ssh"

  tags = {
    Name = var.instance_name
  }
}
