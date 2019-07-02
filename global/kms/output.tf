output "kms_arn" {
  description = "KMS arn"
  value = "${element(concat(aws_kms_key.kms_key.*.arn, list("")), 0)}"
}

output "kms_key_id" {
  description = "KMS key id"
  value = "${element(concat(aws_kms_key.kms_key.*.id, list("")), 0)}"
}

output "kms_arn_logging" {
  description = "KMS arn"
  value = "${element(concat(aws_kms_key.kms_key_logging.*.arn, list("")), 0)}"
}

output "kms_key_id_logging" {
  description = "KMS key id"
  value = "${element(concat(aws_kms_key.kms_key_logging.*.id, list("")), 0)}"
}
