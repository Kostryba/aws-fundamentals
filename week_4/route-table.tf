resource "aws_route_table" "week4-public-route-table" {
  vpc_id = aws_vpc.week4-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.week4-gw.id
  }

  tags = {
    Name = "week4-public-route-table"
  }
}

resource "aws_route_table_association" "public-subnet-route-table-association" {
  subnet_id      = aws_subnet.week4-subnet-public.id
  route_table_id = aws_route_table.week4-public-route-table.id
}
