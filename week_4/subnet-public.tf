resource "aws_subnet" "week4-subnet-public" {
  vpc_id                  = aws_vpc.week4-vpc.id
  cidr_block              = var.subnet_public_cidr_block
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "week4-subnet-public"
  }
}