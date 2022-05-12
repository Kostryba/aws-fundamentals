resource "aws_instance" "ec2-private" {
  ami                    = var.image_id
  instance_type          = var.ec2_instance_type
  availability_zone      = var.private_availability_zone
  subnet_id              = aws_subnet.week4-subnet-private.id
  vpc_security_group_ids = [aws_security_group.private-security-group.id]
  user_data              = <<EOF
      #! /bin/bash
      sudo su
      yum update -y
      yum install httpd -y
      service httpd start
      chkconfig httpd on
      cd /var/www/html
      echo "<html><h1>This is WebServer from private subnet</h1></html>" > index.html
  	EOF

  key_name = "okostryba_lohika_ssh"

  tags = {
    Name = "ec2-private"
  }
}

