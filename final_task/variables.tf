variable "public1_availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "public2_availability_zone" {
  type    = string
  default = "us-east-1b"
}

variable "private1_availability_zone" {
  type    = string
  default = "us-east-1c"
}

variable "private2_availability_zone" {
  type    = string
  default = "us-east-1d"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet1_public_cidr_block" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet2_public_cidr_block" {
  type    = string
  default = "10.0.2.0/24"
}

variable "subnet1_private_cidr_block" {
  type    = string
  default = "10.0.3.0/24"
}

variable "subnet2_private_cidr_block" {
  type    = string
  default = "10.0.4.0/24"
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

variable "dynamodb_table_name" {
  description = "Value of the Name for DynamoDB table"
  type        = string
  default     = "edu-lohika-training-aws-dynamodb"
}

variable "rds_db_name" {
  description = "Value of the Name for db name"
  type        = string
  default     = "EduLohikaTrainingAwsRds"
}