//iam_passrole.tf

data "aws_iam_policy_document" "iam_passrole_pd" {
  statement {
    sid       = "IAMAssumeRole"
    effect    = "Allow"
    actions   = [
      "iam:PassRole"
      ]
    resources = ["*"]
  }
}
