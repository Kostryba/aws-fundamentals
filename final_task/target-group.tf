resource "aws_lb_target_group" "final-target-group" {
  name        = "final-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.final-vpc.id

  health_check {
    path = "/health"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.final-public-machines-autoscaling_group.id
  alb_target_group_arn   = aws_lb_target_group.final-target-group.arn
}