resource "aws_lb" "this_alb" {
  count= "${var.create_alb ? 1 : 0}"
  name           = "${var.name}"
  subnets         = ["${var.subnets}"]
  internal        = "${var.internal}"
  load_balancer_type = "${var.load_balancer_type}"
  access_logs  = ["${var.access_logs}"]
  security_groups = ["${var.security_groups}"]
  idle_timeout                = "${var.idle_timeout}"
  enable_deletion_protection = true

## Uncomment the following lines of code if creating elastic load balancers and change the resource to "aws_elb"
  /*cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"
  listener     = ["${var.listener}"]
  health_check = ["${var.health_check}"]*/

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}

resource "aws_lb_target_group" "alb" {
  count= "${var.create_alb ? length(var.rules_alb) : 0}"
  port = "${element(var.rules_alb["rules_alb_${count.index}"], 0)}"
  protocol = "${element(var.rules_alb["rules_alb_${count.index}"], 1)}"
  vpc_id = "${element(var.rules_alb["rules_alb_${count.index}"], 2)}"
  name = "${element(var.rules_alb["rules_alb_${count.index}"], 3)}"
  
  health_check {
                path = "${element(var.rules_alb["rules_alb_${count.index}"], 4)}"
                port = "${element(var.rules_alb["rules_alb_${count.index}"], 0)}"
                protocol = "${element(var.rules_alb["rules_alb_${count.index}"], 1)}"
                healthy_threshold = "${element(var.rules_alb["rules_alb_${count.index}"], 5)}"
                unhealthy_threshold = "${element(var.rules_alb["rules_alb_${count.index}"], 6)}"
                interval = "${element(var.rules_alb["rules_alb_${count.index}"], 7)}"
                timeout = "${element(var.rules_alb["rules_alb_${count.index}"], 8)}"
                matcher = "${element(var.rules_alb["rules_alb_${count.index}"], 9)}"
        }
}


resource "aws_lb_listener" "alb" {
  count= "${var.create_alb ? length(var.rules_listener_alb) : 0}"
  load_balancer_arn = "${aws_lb.this_alb.arn}"
  port = "${element(var.rules_listener_alb["rules_listener_alb_${count.index}"], 0)}"
  protocol = "${element(var.rules_listener_alb["rules_listener_alb_${count.index}"], 1)}"
  # Uncomment these if using ssl_policy and certificate_arn

  #ssl_policy = "${element(var.rules_listener_alb["rules_listener_alb_${count.index}"], 2)}"
  #certificate_arn = "${element(var.rules_listener_alb["rules_listener_alb_${count.index}"], 3)}"
  default_action {
    target_group_arn = "${element(aws_lb_target_group.alb.*.arn, count.index)}"
    type             = "forward"
  }
}


resource "aws_lb" "this_nlb" {
  count= "${var.create_nlb ? 1 : 0}"
  name           = "${var.name}"
  subnets         = ["${var.subnets}"]
  internal        = "${var.internal}"
  load_balancer_type = "${var.load_balancer_type}"
  access_logs  = ["${var.access_logs}"]
  idle_timeout                = "${var.idle_timeout}"
  enable_deletion_protection = true

## Uncomment the following lines of code if creating elastic load balancers and change the resource to "aws_elb"
  /*cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"
  listener     = ["${var.listener}"]
  health_check = ["${var.health_check}"]*/

  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
}


resource "aws_lb_target_group" "nlb" {
  count= "${var.create_nlb ? length(var.rules_nlb) : 0}"
  port = "${element(var.rules_nlb["rules_nlb_${count.index}"], 0)}"
  protocol = "${element(var.rules_nlb["rules_nlb_${count.index}"], 1)}"
  vpc_id = "${element(var.rules_nlb["rules_nlb_${count.index}"], 2)}"
  name = "${element(var.rules_nlb["rules_nlb_${count.index}"], 3)}"
  stickiness = []
}


resource "aws_lb_listener" "nlb" {
  count= "${var.create_nlb ? length(var.rules_listener_nlb) : 0}"
  load_balancer_arn = "${aws_lb.this_nlb.arn}"
  port = "${element(var.rules_listener_nlb["rules_listener_nlb_${count.index}"], 0)}"
  protocol = "${element(var.rules_listener_nlb["rules_listener_nlb_${count.index}"], 1)}"
  # Uncomment these if using ssl_policy and certificate_arn

  #ssl_policy = "${element(var.rules_listener_nlb["rules_listener_nlb_${count.index}"], 2)}"
  #certificate_arn = "${element(var.rules_listener_nlb["rules_listener_nlb_${count.index}"], 3)}"
  default_action {
    target_group_arn = "${element(aws_lb_target_group.nlb.*.arn, count.index)}"
    type             = "forward"
  }
}
