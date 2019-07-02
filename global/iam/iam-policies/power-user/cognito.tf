//cognito.tf

data "aws_iam_policy_document" "cognito_pd" {
  statement {
    sid       = "CognitoSplatPermissions"
    effect    = "Allow"
    actions   = [
      "cognito-identity:*",
      "cognito-sync:*",
      "cognito-idp:*"]
    resources = ["*"]
  }
}
