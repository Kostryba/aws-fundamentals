resource "aws_db_instance" "week3db" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13.5"
  name                   = "week3db"
  username               = "week3user"
  password               = "hello12345"
  skip_final_snapshot    = true
  instance_class         = "db.t3.micro"
  vpc_security_group_ids = [aws_security_group.rds_group.id]
}