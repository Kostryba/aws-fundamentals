resource "aws_vpc" "week4-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "week4-vpc"
  }
}