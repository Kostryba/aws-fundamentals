resource "aws_lb_target_group" "week4-target-group" {
  name        = "week4-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.week4-vpc.id
}

resource "aws_lb_target_group_attachment" "week4-target-group-attachment-ec2-public" {
  target_group_arn = aws_lb_target_group.week4-target-group.arn
  target_id        = aws_instance.ec2-public.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "week4-target-group-attachment-ec2-private" {
  target_group_arn = aws_lb_target_group.week4-target-group.arn
  target_id        = aws_instance.ec2-private.id
  port             = 80
}