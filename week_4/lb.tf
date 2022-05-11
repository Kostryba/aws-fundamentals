resource "aws_lb" "week4-lb" {
  name               = "week4-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public-security-group.id]
  subnets            = [aws_subnet.week4-subnet-public.id, aws_subnet.week4-subnet-private.id]

  tags = {
    Name = "week4-lb"
  }
}

resource "aws_lb_listener" "week4-lb-listener" {
  load_balancer_arn = aws_lb.week4-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.week4-target-group.arn
  }
}