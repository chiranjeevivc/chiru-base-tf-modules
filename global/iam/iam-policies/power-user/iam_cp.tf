//iam_cp.tf content-portal specific iam policy permissions
data "aws_iam_policy_document" "iam_cp_pd" {
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
      "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
      "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
      "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
      "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
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
        "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
        "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
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
    sid    = "AllowUsersToSeeStatsOnIAMConsoleDashboard"
    effect = "Allow"

    actions = [
      "iam:GetAccount*",
      "iam:ListAccount*",
    ]

    resources = ["*"]
  }
}
