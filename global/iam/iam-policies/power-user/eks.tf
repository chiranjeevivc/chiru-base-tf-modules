//eks.tf

data "aws_iam_policy_document" "eks_pd" {
  statement {
    sid    = "EKSSplatPermissions"
    effect = "Allow"

    actions = [
      "eks:*",
    ]

    resources = ["*"]
  }
}
