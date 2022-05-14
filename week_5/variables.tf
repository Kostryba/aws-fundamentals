variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "image_id" {
  type    = string
  default = "ami-03ededff12e34e59e"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sns_topic_name" {
  type    = string
  default = "week_5_sns"
}

variable "sqs_queue_name" {
  type    = string
  default = "week_5_queue"
}
