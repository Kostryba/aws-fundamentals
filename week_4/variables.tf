variable "public_availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "private_availability_zone" {
  type    = string
  default = "us-east-1b"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_public_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet_private_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "image_id" {
  type    = string
  default = "ami-03ededff12e34e59e"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "nat-image_id" {
  type    = string
  default = "ami-003acd4f8da7e06f9"
}