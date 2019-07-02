output "iam_user_arn" {
  description = "The IAM User ARN"
  value       = "${element(concat(aws_iam_user.iam_user.*.arn, list("")), 0)}"
}

output "iam_user_name" {
  description = "The IAM User name"
  value       = "${element(concat(aws_iam_user.iam_user.*.name, list("")), 0)}"
}
