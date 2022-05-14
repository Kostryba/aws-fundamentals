output "app_server_public_ip" {
  value = element(aws_instance.app_server.*.public_ip, 0)
}

output "week_4_sns_topic_arn" {
  value = aws_sns_topic.week_4_sns.arn
}

output "week_4_sqs_queue_url" {
  value = aws_sqs_queue.week_4_queue.url
}
