resource "aws_route_table" "final-public-route-table" {
  vpc_id = aws_vpc.final-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.final-public-gw.id
  }

  tags = {
    Name = "final-public-route-table"
  }
}

resource "aws_route_table_association" "public-subnet1-route-table-association" {
  subnet_id      = aws_subnet.final-subnet1-public.id
  route_table_id = aws_route_table.final-public-route-table.id
}

resource "aws_route_table_association" "public-subnet2-route-table-association" {
  subnet_id      = aws_subnet.final-subnet2-public.id
  route_table_id = aws_route_table.final-public-route-table.id
}

