resource "aws_internet_gateway" "final-public-gw" {
  vpc_id = aws_vpc.final-vpc.id

  tags = {
    Name = "final-public-gw"
  }
}