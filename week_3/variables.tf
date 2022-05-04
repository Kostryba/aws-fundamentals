variable "image_id" {
  type    = string
  default = "ami-03ededff12e34e59e"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "dynamodb_table_name" {
  description = "Value of the Name for DynamoDB table"
  type        = string
  default     = "dynamodb-customers"
}