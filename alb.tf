resource "aws_lb" "alb" {
  name               = "microservices-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id]

  tags = {
    Name = "microservices-alb"
  }
}