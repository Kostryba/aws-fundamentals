output "app_server_public_ip" {
  value = element(aws_instance.app_server.*.public_ip, 0)
}

output "week_5_sns_topic_arn" {
  value = aws_sns_topic.week_5_sns.arn
}

output "week_5_sqs_queue_url" {
  value = aws_sqs_queue.week_5_queue.url
}
