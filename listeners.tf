resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg3.arn
  }
}

resource "aws_lb_listener_rule" "rule1" {
  listener_arn = aws_lb_listener.http_listener.arn

  condition {
    path_pattern {
      values = ["/browse*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg1.arn
  }
}

resource "aws_lb_listener_rule" "rule2" {
  listener_arn = aws_lb_listener.http_listener.arn

  condition {
    path_pattern {
      values = ["/buy*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg2.arn
  }
}