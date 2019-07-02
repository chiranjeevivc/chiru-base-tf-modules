//fulladmin.tf

data "aws_iam_policy_document" "fulladmin_pd" {
  statement {
    sid       = "FullAdminPermissions"
    effect    = "Allow"
    actions   = [
      "*"]
    resources = ["*"]
  }
}
