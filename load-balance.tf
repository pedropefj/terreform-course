resource "aws_elb" "terraform-elb-course" {
  provider = "aws.us-east-2"
  name               = "terraform-elb-course"
  availability_zones = ["us-east-2a","us-east-2b","us-east-2c"]
  security_groups  = ["${aws_security_group.acesso-web-external.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  instances                   = ["${element(aws_instance.dev.*.id, 0)}","${element(aws_instance.dev.*.id, 1)}","${element(aws_instance.dev.*.id, 2)}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "terraform-elb-course"
  }
depends_on = ["aws_instance.dev[0]","aws_instance.dev[1]","aws_instance.dev[2]","aws_security_group.acesso-web-external"]
}