resource "aws_security_group" "rds_group" {
  name        = "rds_group"
  description = "Allow connection to rds"
  vpc_id      = aws_vpc.final-vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.subnet1_private_cidr_block, var.subnet2_private_cidr_block]
  }
}