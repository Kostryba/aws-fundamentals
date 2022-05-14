resource "aws_instance" "app_server" {
  ami                    = var.image_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.http_and_ssh_group.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  key_name = "okostryba_lohika_ssh"

  tags = {
    Name = var.instance_name
  }
}

