resource "aws_launch_template" "final-public-launch-template" {
  name_prefix            = "final-public-launch-template"
  image_id               = var.image_id
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.public-security-group.id]
  key_name               = "okostryba_lohika_ssh"
  user_data              = filebase64("${path.module}/public-ec2-user-data.sh")

  iam_instance_profile {
    arn = aws_iam_instance_profile.final_ec2_profile.arn
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ec2-public"
    }
  }
}

resource "aws_autoscaling_group" "final-public-machines-autoscaling_group" {
  name                = "final-public-machines-autoscaling_group"
  max_size            = 2
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.final-subnet1-public.id, aws_subnet.final-subnet2-public.id]

  launch_template {
    id      = aws_launch_template.final-public-launch-template.id
    version = aws_launch_template.final-public-launch-template.latest_version
  }
}