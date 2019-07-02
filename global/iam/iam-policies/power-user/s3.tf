//s3.tf

data "aws_iam_policy_document" "s3_pd" {
  statement {
    sid       = "S3SplatPermissions"
    effect    = "Allow"
    actions   = [
      "s3:*"]
    resources = ["*"]
  }
}

// Need to adjust this to limit S3 access to namespace accounts, TFState, and Select S3 Buckets
