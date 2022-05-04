output "app_server_public_ip" {
  value = element(aws_instance.app_server.*.public_ip, 0)
}

output "rds_endpoint" {
  value = aws_db_instance.week3db.endpoint
}
