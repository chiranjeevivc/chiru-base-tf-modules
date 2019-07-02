//base.tf
data "aws_iam_policy_document" "base_pd" {
  statement {
    sid    = "DeniedPolicies"
    effect = "Deny"

    actions = [
      "iam:CreatePolic*",
      "iam:DeletePolic*",
      "iam:SetDefaultPolicyVersion",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "ListAllPolicies"
    effect = "Allow"

    actions = [
      "iam:List*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "EC2IAMPassroleToInstance"
    effect = "Allow"

    actions = [
      "iam:PassRole",
      "iam:GetRole",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:role/${var.module_tenant_namespace}-*",
      "arn:aws:iam::*:role/lambda_basic_execution",
    ]
  }

  statement {
    sid    = "IAMServerCertSplatPermissions"
    effect = "Allow"

    actions = [
      "iam:DescribeCertificate",
    ]

    //covered with a splat at the top
    // "iam:ListCertificate",
    // "iam:ListTagsForCertificate"

    resources = ["*"]
  }

  statement {
    sid    = "IAMServerCertificatePermissions"
    effect = "Allow"

    actions = [
      "iam:UploadServerCertificate",
      "iam:DeleteServerCertificate",
      "iam:ListServerCertificates",
      "iam:UpdateServerCertificate",
      "iam:GetServerCertificate",
    ]

    resources = ["arn:aws:iam::${var.module_account_id}:server-certificate/${var.module_tenant_namespace}-*"]
  }

  statement {
    sid    = "AllowedNSPolicies"
    effect = "Allow"

    actions = [
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:ListEntitiesForPolicy",
      "iam:ListPolicyVersions",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:policy/${var.module_tenant_namespace}-*",
      "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
      "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole",
      "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole",
    ]
  }

  statement {
    sid    = "ListInstanceProfile"
    effect = "Allow"

    actions = [
      "iam:AddRoleToInstanceProfile",
      "iam:CreateInstanceProfile",
      "iam:DeleteInstanceProfile",
      "iam:GetInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:instance-profile/${var.module_tenant_namespace}-*",
    ]
  }

  statement {
    sid    = "RolePolicyNamespaceActions"
    effect = "Allow"

    actions = [
      "iam:AttachRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:DetachRolePolicy",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:role/${var.module_tenant_namespace}-*",
    ]

    condition {
      test     = "ArnLike"
      variable = "iam:PolicyArn"

      values = [
        "arn:aws:iam::${var.module_account_id}:policy/${var.module_tenant_namespace}*",
        "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",
        "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceAutoscaleRole",
        "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole",
      ]
    }
  }

  statement {
    sid    = "RoleNamespaceActions"
    effect = "Allow"

    actions = [
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:ListAttachedRolePolicies",
      "iam:ListInstanceProfilesForRole",
      "iam:ListRolePolicies",
      "iam:UpdateAssumeRolePolicy",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:role/${var.module_tenant_namespace}-*",
    ]
  }

  statement {
    sid    = "PowerUserKMS"
    effect = "Allow"

    actions = [
      "kms:*",
    ]

    resources = ["*"]
  }

  statement {
    sid       = "AllowServiceUserAttaching"
    effect    = "Allow"
    actions   = ["iam:AttachUserPolicy"]
    resources = ["arn:aws:iam::${var.module_account_id}:user/s.${var.module_tenant_namespace}*"]

    condition {
      test     = "ArnLike"
      variable = "iam:PolicyArn"
      values   = ["arn:aws:iam::${var.module_account_id}:policy/${var.module_tenant_namespace}*"]
    }
  }

  statement {
    sid    = "AllowUsersToPerformServiceUserActions"
    effect = "Allow"

    actions = [
      "iam:CreateAccessKey",
      "iam:CreateUser",
      "iam:DeleteAccessKey",
      "iam:DeleteLoginProfile",
      "iam:DeleteSigningCertificate",
      "iam:DeleteUser",
      "iam:DeleteUserPolicy",
      "iam:DetachUserPolicy",
      "iam:GetUser",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroupsForUser",
      "iam:ListUserPolicies",
      "iam:ListUsers",
      "iam:RemoveUserFromGroup",
      "iam:UpdateUser",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:user/s.${var.module_tenant_namespace}*",
    ]
  }

  statement {
    sid    = "AllowUsersToSeeStatsOnIAMConsoleDashboard"
    effect = "Allow"

    actions = [
      "iam:GetAccount*",
      "iam:ListAccount*",
    ]

    resources = ["*"]
  }

  // Allows Access to User Credentials
  statement {
    sid    = "AllowIndividualUserToSeeAndManageOnlyTheirOwnAccountInformation"
    effect = "Allow"

    actions = [
      "iam:ChangePassword",
      "iam:CreateAccessKey",
      "iam:CreateLoginProfile",
      "iam:DeleteAccessKey",
      "iam:DeleteLoginProfile",
      "iam:GetAccountPasswordPolicy",
      "iam:GetLoginProfile",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
      "iam:UpdateLoginProfile",
      "iam:ListSigningCertificates",
      "iam:DeleteSigningCertificate",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate",
      "iam:ListSSHPublicKeys",
      "iam:GetSSHPublicKey",
      "iam:DeleteSSHPublicKey",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey",
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:user/$${aws:username}",
    ]
  }

  statement {
    sid    = "AllowIndividualUserToListOnlyTheirOwnMFA"
    effect = "Allow"

    actions = [
      "iam:ListVirtualMFADevices",
      "iam:ListMFADevices"
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:mfa/*",
      "arn:aws:iam::${var.module_account_id}:user/$${aws:username}"
    ]
  }

  statement {
    sid    = "AllowIndividualUserToManageTheirOwnMFA"
    effect = "Allow"

    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:RequestSmsMfaRegistration",
      "iam:FinalizeSmsMfaRegistration",
      "iam:EnableMFADevice",
      "iam:ResyncMFADevice"
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:mfa/$${aws:username}",
      "arn:aws:iam::${var.module_account_id}:user/$${aws:username}"
    ]
  }

  statement {
    sid    = "AllowIndividualUserToDeactivateOnlyTheirOwnMFAOnlyWhenUsingMFA"
    effect = "Allow"

    actions = [
      "iam:DeactivateMFADevice"
    ]

    resources = [
      "arn:aws:iam::${var.module_account_id}:mfa/$${aws:username}",
      "arn:aws:iam::${var.module_account_id}:user/$${aws:username}"
    ]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }
  }

  // Blocks Access without MFA
//  statement {
//    sid    = "BlockAnyAccessOtherThanAboveUnlessSignedInWithMFA"
//    effect = "Deny"
//
//    not_actions = [
//      "iam:*",
//      "iot:*",
//      "dynamodb:Describe*"
//    ]
//
//    resources = [
//      "*"
//    ]
//
//    condition {
//      test     = "BoolIfExists"
//      variable = "aws:MultiFactorAuthPresent"
//      values   = ["false"]
//    }
//  }
}
