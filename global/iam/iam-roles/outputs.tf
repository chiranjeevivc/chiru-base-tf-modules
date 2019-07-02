output "iam_role_arn_all" {
  description = "The IAM Role ARN"
  value       = "${aws_iam_role.iam_role.*.arn}"
}

output "iam_role_name_all" {
  description = "The IAM Role name"
  value       = "${aws_iam_role.iam_role.*.name}"
}

output "iam_role_arn" {
  description = "The IAM Role ARN"
  value       = "${element(concat(aws_iam_role.iam_role.*.arn, list("")), 0)}"
}

output "iam_role_name" {
  description = "The IAM Role name"
  value       = "${element(concat(aws_iam_role.iam_role.*.name, list("")), 0)}"
}
