//infra_admin.tf

data "aws_iam_policy_document" "infra_admin_pd" {
  statement {
    sid    = "DenyRestrictedS3Actions"
    effect = "Deny"

    actions = [
      "s3:CreateBucket",
      "s3:DeleteBucket",
      "s3:PutBucketPolicy",
      "s3:DeleteBucketPolicy",
      "s3:PutBucketAcl",
      "s3:PutObjectAcl",
      "s3:PutBucketCORS",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "DenyRestrictedIAMActions"
    effect = "Deny"

    actions = [
      "iam:CreatePolic*",
      "iam:DeletePolic*",
      "iam:SetDefaultPolicyVersion",
      "iam:AddRoleToInstanceProfile",
      "iam:Attach*",
      "iam:DeleteRolePolicy",
      "iam:Detach*",
      "iam:UpdateAssumeRolePolicy",
      "iam:AddUserToGroup",
      "iam:Put*",
    ]

    resources = ["*"]
  }

  statement {
    sid    = "DenyRestrictedVPCActions"
    effect = "Deny"

    actions = [
      "ec2:CreateInternetGateway",
    ]

    resources = ["*"]
  }
}
