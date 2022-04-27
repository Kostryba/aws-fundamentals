output "app_server_id1" {
  value = "${element(aws_instance.app_server.*.id, 0)}"
}
