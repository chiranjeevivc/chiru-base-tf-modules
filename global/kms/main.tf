resource "aws_kms_key" "kms_key" {
  count = "${var.kms_general ? 1 : 0}"
  description             = "${var.description}"
  key_usage               = "${var.key_usage}"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
  tags                    = "${var.tags}"
  policy = "${data.aws_iam_policy_document.kms-policy.json}"
  is_enabled              = "${var.is_enabled}"
}

resource "aws_kms_alias" "key_name" {
  count = "${var.kms_general ? 1 : 0}"
  name               = "alias/${var.name}"
  target_key_id      = "${aws_kms_key.kms_key.key_id}"
}

resource "aws_kms_key" "kms_key_logging" {
  count = "${var.kms_logging ? 1 : 0}"
  description             = "${var.description}"
  key_usage               = "${var.key_usage}"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
  tags                    = "${var.tags}"
  policy                    = "${data.aws_iam_policy_document.kms-policy-logging.json}"
  is_enabled              = "${var.is_enabled}"
}

resource "aws_kms_alias" "key_name_logging" {
  count = "${var.kms_logging ? 1 : 0}"
  name               = "alias/${var.name}"
  target_key_id      = "${aws_kms_key.kms_key_logging.key_id}"
}
