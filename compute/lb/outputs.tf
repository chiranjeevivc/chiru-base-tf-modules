output "this_alb_id" {
  description = "The name of the ALB"
  value       = "${element(concat(aws_lb.this_alb.*.id, list("")), 0)}"
}

output "this_alb_arn" {
  description = "The ARN of the ALB"
  value       = "${element(concat(aws_lb.this_alb.*.arn, list("")), 0)}"
}

output "this_alb_name" {
  description = "The name of the ALB"
  value       = "${element(concat(aws_lb.this_alb.*.name, list("")), 0)}"
}

output "this_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = "${element(concat(aws_lb.this_alb.*.dns_name, list("")), 0)}"
}

output "this_alb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = "${element(concat(aws_lb.this_alb.*.zone_id, list("")), 0)}"
}

output "this_nlb_id" {
  description = "The name of the NLB"
  value       = "${element(concat(aws_lb.this_nlb.*.id, list("")), 0)}"
}

output "this_nlb_arn" {
  description = "The ARN of the NLB"
  value       = "${element(concat(aws_lb.this_nlb.*.arn, list("")), 0)}"
}

output "this_nlb_name" {
  description = "The name of the NLB"
  value       = "${element(concat(aws_lb.this_nlb.*.name, list("")), 0)}"
}

output "this_nlb_dns_name" {
  description = "The DNS name of the NLB"
  value       = "${element(concat(aws_lb.this_nlb.*.dns_name, list("")), 0)}"
}

output "this_nlb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = "${element(concat(aws_lb.this_nlb.*.zone_id, list("")), 0)}"
}

output "target_group_arns_nlb" {
  description = "ARNs of the target groups for NLB. Useful for passing to your Auto Scaling group."
  value       = "${aws_lb_target_group.nlb.*.arn}"
}

output "target_group_arns_alb" {
  description = "ARNs of the target groups for ALB. Useful for passing to your Auto Scaling group."
  value       = "${aws_lb_target_group.alb.*.arn}"
}
