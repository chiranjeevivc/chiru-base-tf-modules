//emr.tf

data "aws_iam_policy_document" "emr_pd" {
  statement {
    sid    = "EMRSplatPermissions"
    effect = "Allow"

    actions = [
      "elasticmapreduce:*",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
    ]

    resources = ["*"]
  }
}
