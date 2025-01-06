resource "aws_launch_configuration" "app" {
  name          = "app-launch-config"
  image_id      = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  launch_configuration = aws_launch_configuration.app.id
  vpc_zone_identifier  = [aws_subnet.private_subnet_1.id]
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1

  target_group_arns = [aws_lb_target_group.tg1.arn]

  tag {
    key                 = "Name"
    value               = "ec2-app-instance"
    propagate_at_launch = true
  }
}