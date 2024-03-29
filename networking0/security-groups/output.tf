output "this_security_group_id" {
  description = "The ID of the security group"
  value       = "${element(concat(aws_security_group.this.*.id, list("")), 0)}"
}

output "security_group_id" {
  value= "${aws_security_group.this.0.id}"
}

output "this_security_group_vpc_id" {
  description = "The VPC ID"
  value       = "${element(concat(aws_security_group.this.*.vpc_id, list("")), 0)}"
}

output "this_security_group_owner_id" {
  description = "The owner ID"
  value       = "${element(concat(aws_security_group.this.*.owner_id, list("")), 0)}"
}

output "this_security_group_name" {
  description = "The name of the security group"
  value       = "${element(concat(aws_security_group.this.*.name, list("")), 0)}"
}

output "this_security_group_description" {
  description = "The description of the security group"
  value       = "${element(concat(aws_security_group.this.*.description, list("")), 0)}"
}
