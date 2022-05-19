resource "aws_vpc" "final-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "final-vpc"
  }
}