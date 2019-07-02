output "lambda_arns_local"{
  value = "${element(concat(aws_lambda_function.lambda.*.arn, list("")), 0)}"
}

output "lambda_arn_s3"{
  value = "${element(concat(aws_lambda_function.lambda_with_s3.*.arn, list("")), 0)}"
}
