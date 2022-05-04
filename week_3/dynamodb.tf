resource "aws_dynamodb_table" "dynamodb-customers" {
  name           = var.dynamodb_table_name
  hash_key       = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "id"
    type = "S"
  }
}