//cwe.tf

data "aws_iam_policy_document" "cwe_pd" {
  statement {
    sid    = "CloudWatchEventSplatPermissions"
    effect = "Allow"

    actions = [
      "events:*",
    ]

    resources = [
      "arn:aws:events:us-east-1:${var.module_account_id}:rule/${var.module_tenant_namespace}-*",
    ]
  }
}
