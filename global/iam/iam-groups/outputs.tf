output "iam_group_arn" {
  description = "The IAM Group ARN"
  #value       = "${aws_iam_group.iam_group.arn}"
  value = "${element(concat(aws_iam_group.iam_group.*.arn, list("")), 0)}"
}

output "iam_group_name" {
  description = "The IAM Group name"
  value       = "${element(concat(aws_iam_group.iam_group.*.name, list("")), 0)}"
}
