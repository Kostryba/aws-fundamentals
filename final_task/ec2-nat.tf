resource "aws_instance" "ec2-nat" {
  ami                    = var.nat-image_id
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.final-subnet1-public.id
  vpc_security_group_ids = [aws_security_group.public-security-group.id]
  source_dest_check      = false
  key_name               = "okostryba_lohika_ssh"

  tags = {
    Name = "ec2-nat"
  }
}

