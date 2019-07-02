//cognito.tf

data "aws_iam_policy_document" "assumerole_only_pd" {
  statement {
    sid    = "RestrictedAssumeRolePermissions"
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    resources = ["${var.assumable_roles}"]
  }
}
