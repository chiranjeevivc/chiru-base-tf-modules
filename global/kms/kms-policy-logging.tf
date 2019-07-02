data "aws_iam_policy_document" "kms-policy-logging" {
  statement {
      sid = "Enable IAM User Permissions"
      effect= "Allow"
      principals {
        type = "AWS"
			  identifiers = ["${var.iam_key_users_permissions_identifiers}"]
      }
      actions= ["${var.iam_key_users_permissions_actions}"]
      resources= ["${var.iam_key_users_permissions_resources}"]
    }

  statement {
      sid = "Allow access for Key Administrators"
      effect= "Allow"
      principals {
        type = "AWS"
			  identifiers = ["${var.iam_users_key_administrators_access_identifiers}"]
      }
      actions= ["${var.iam_users_key_administrators_access_actions}"]
      resources=  ["${var.iam_users_key_administrators_access_resources}"]
    }
  statement {
      sid = "Allow use of the key"
      effect= "Allow"
      principals {
        type = "AWS"
			  identifiers = ["${var.iam_key_users}"]
      }
      actions= ["${var.iam_key_users_actions}"]
      resources= ["${var.iam_key_users_resources}"]
    }
    statement {
        sid = "AWSCloudTrail"
        effect= "Allow"
        principals {
          type = "Service"
          identifiers = ["cloudtrail.amazonaws.com"]
        }
        actions= ["kms:*"]
        resources= ["*"]
      }
}
