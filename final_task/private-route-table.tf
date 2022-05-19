resource "aws_route_table" "final-private-route-table" {
  vpc_id = aws_vpc.final-vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.ec2-nat.id
  }

  tags = {
    Name = "final-private-route-table"
  }
}

resource "aws_route_table_association" "private-subnet1-route-table-association" {
  subnet_id      = aws_subnet.final-subnet1-private.id
  route_table_id = aws_route_table.final-private-route-table.id
}

resource "aws_route_table_association" "private-subnet2-route-table-association" {
  subnet_id      = aws_subnet.final-subnet2-private.id
  route_table_id = aws_route_table.final-private-route-table.id
}
