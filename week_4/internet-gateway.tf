resource "aws_internet_gateway" "week4-gw" {
  vpc_id = aws_vpc.week4-vpc.id

  tags = {
    Name = "week4-gw"
  }
}