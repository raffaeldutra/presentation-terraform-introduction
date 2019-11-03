resource "aws_lb" "tutorial_lb" {
  name               = "tutorial-lb-${terraform.workspace}"
  internal           = false
  load_balancer_type = "application"
  subnets            = data.aws_subnet_ids.public.ids
  security_groups    = [aws_security_group.tutorial_sg.id]

  tags = "${merge(var.tags["values"])}"
}

resource "aws_lb_target_group_attachment" "tutorial" {
  count            = length(aws_instance.tutorial)
  target_group_arn = "${aws_lb_target_group.tutorial.arn}"
  target_id        = "${aws_instance.tutorial[count.index].id}"
  port             = 80
}

resource "aws_lb_target_group" "tutorial" {
  name     = "tutorial-tg-${terraform.workspace}"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.tutorial.id

  tags = "${merge(var.tags["values"])}"

  stickiness {
    type            = "lb_cookie"
    cookie_duration = 60
    enabled         = false
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = "80"
  }
}

resource "aws_lb_listener" "tutorial_lb_listener" {
  load_balancer_arn = aws_lb.tutorial_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tutorial.arn
    type             = "forward"
  }
}