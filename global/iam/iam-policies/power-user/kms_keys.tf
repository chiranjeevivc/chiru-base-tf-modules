//kms_keys.tf
//Supports the accessing of cross-account KMS keys

data "aws_iam_policy_document" "kms_keys_pd" {
  statement {
    sid    = "kmsListAccess"
    effect = "Allow"

    actions = [
      "kms:ListKeys",
      "kms:ListAliases",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "kmsCrossAccountAccess"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:Generatedatakey*",
      "kms:ReEncrypt*",
      "kms:Describekey*",
    ]

    resources = [
      "${var.kms_key_arns}",
    ]
  }

  statement {
    sid    = "PowerUserKMS"
    effect = "Allow"

    actions = [
      "kms:*",
    ]

    resources = ["*"]
  }
}
