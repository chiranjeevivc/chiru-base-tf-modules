#
## Create KMS Key for EMR Encryption
#
/*
resource "aws_kms_key" "emr_kms_key" {
  description             = "KMS key for EMR EC2 instances encryption"
  policy = "${data.aws_iam_policy_document.emr_kms_policy.json}"
  deletion_window_in_days = 30
}

#give the kms key a name

resource "aws_kms_alias" "emr_kms_key" {
  name = "${var.emr_kms_key_alias_name}"
  target_key_id = "${aws_kms_key.emr_kms_key.key_id}"
}
*/
