resource "aws_subnet" "final-subnet1-private" {
  vpc_id            = aws_vpc.final-vpc.id
  cidr_block        = var.subnet1_private_cidr_block
  availability_zone = var.private1_availability_zone

  tags = {
    Name = "final-subnet1-private"
  }
}

resource "aws_subnet" "final-subnet2-private" {
  vpc_id            = aws_vpc.final-vpc.id
  cidr_block        = var.subnet2_private_cidr_block
  availability_zone = var.private2_availability_zone

  tags = {
    Name = "final-subnet2-private"
  }
}

resource "aws_db_subnet_group" "final-subnet-private-group" {
  name       = "final-subnet-private-group"
  subnet_ids = [aws_subnet.final-subnet1-private.id, aws_subnet.final-subnet2-private.id]

  tags = {
    Name = "final-subnet-private-group"
  }
}