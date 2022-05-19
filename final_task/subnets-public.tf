resource "aws_subnet" "final-subnet1-public" {
  vpc_id                  = aws_vpc.final-vpc.id
  cidr_block              = var.subnet1_public_cidr_block
  availability_zone       = var.public1_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "final-subnet1-public"
  }
}

resource "aws_subnet" "final-subnet2-public" {
  vpc_id                  = aws_vpc.final-vpc.id
  cidr_block              = var.subnet2_public_cidr_block
  availability_zone       = var.public2_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "final-subnet2-public"
  }
}
