# CREATE APPLICATION LOAD BALANCER and TARGET GROUP

resource "aws_lb" "alb" {
  name               = "ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public-subnet-az1c.id, aws_subnet.public-subnet-az1a.id]
  tags = {
    Name = "APPLICATION LOAD-BALANCER"
  }
}
resource "aws_lb_target_group" "targetgroup" {
  name     = "targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}


# Attached ALB to the Frontend Server 

resource "aws_alb_target_group_attachment" "attach-frontend" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.frontend.id
  port             = 80
}

# create listner to redirect the traffic 

resource "aws_lb_listener" "frontend-listner" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.targetgroup.arn
    type             = "forward"
  }
}