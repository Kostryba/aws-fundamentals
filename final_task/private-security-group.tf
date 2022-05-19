resource "aws_security_group" "private-security-group" {
  name        = "private-security-group"
  description = "Allow http and ssh and ping at client host from vpc"
  vpc_id      = aws_vpc.final-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.subnet1_public_cidr_block, var.subnet2_public_cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.subnet1_public_cidr_block, var.subnet2_public_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "private-security-group"
  }
}
