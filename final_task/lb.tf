resource "aws_lb" "final-lb" {
  name               = "final-lb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.final-subnet1-public.id, aws_subnet.final-subnet2-public.id]
  security_groups    = [aws_security_group.public-security-group.id]
  tags = {
    Name = "final-lb"
  }
}

resource "aws_lb_listener" "final-lb-listener" {
  load_balancer_arn = aws_lb.final-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.final-target-group.arn
  }
}