resource "aws_db_instance" "final_rds_db" {
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = "13.5"
  name                   = var.rds_db_name
  username               = "rootuser"
  password               = "rootuser"
  skip_final_snapshot    = true
  instance_class         = "db.t3.micro"
  vpc_security_group_ids = [aws_security_group.rds_group.id]
  db_subnet_group_name   = aws_db_subnet_group.final-subnet-private-group.name
}