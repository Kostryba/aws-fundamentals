resource "aws_subnet" "week4-subnet-private" {
  vpc_id            = aws_vpc.week4-vpc.id
  cidr_block        = var.subnet_private_cidr_block
  availability_zone = var.private_availability_zone

  tags = {
    Name = "week4-subnet-private"
  }
}