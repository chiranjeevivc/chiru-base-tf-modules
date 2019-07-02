//s3_restricted.tf

data "aws_iam_policy_document" "s3_restricted_pd" {
  statement {
    sid    = "RestrictedS3Permissions"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:HeadBucket",
      "s3:GetBucketLocation",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "ListSpecificBuckets"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListObject",
      "s3:DeleteObject",
      "s3:GetObjectTagging",
      "s3:PutObjectTagging",
      "s3:DeleteObectTagging",
    ]

    resources = ["${var.restricted_buckets}"]
  }

  statement {
    sid    = "ListKMSKeys"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:Encrypt",
      "kms:Generatedatakey*",
      "kms:ReEncrypt*",
      "kms:Describekey*",
    ]

    resources = ["${var.bucket_kms_keys}"]
  }

  statement {
    sid    = "ListKMS"
    effect = "Allow"

    actions = [
      "kms:ListKeys",
      "kms:ListAliases",
    ]

    resources = ["*"]
  }
}
