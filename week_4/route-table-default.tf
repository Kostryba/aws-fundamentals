resource "aws_default_route_table" "week4-default-route-table" {
  default_route_table_id = aws_vpc.week4-vpc.default_route_table_id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.ec2-nat.id
  }

  tags = {
    Name = "week4-default-route-table"
  }
}