//service-trust-policy.tf

data "aws_iam_policy_document" "principal_service_trust_policy_pd" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["${var.trust_policy_principals}"]
    }

    effect = "Allow"
    sid    = ""
  }

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["${var.trust_policy_services}"]
    }

    effect = "Allow"
    sid    = ""
  }
}
