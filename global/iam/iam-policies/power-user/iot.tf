//iot.tf

data "aws_iam_policy_document" "iot_pd" {
  statement {
    sid       = "IOTSplatPermissions"
    effect    = "Allow"
    actions   = [
      "iot:*"]
    resources = ["*"]
  }
}
