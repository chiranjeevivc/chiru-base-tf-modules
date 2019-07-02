//dynamodb.tf
data "aws_iam_policy_document" "storage_pd" {
  statement {
    sid    = "DynamodbConsoleROAccess"
    effect = "Allow"

    actions = [
      "autoscaling:Describe*",
      "logs:Get*",
      "logs:Describe*",
      "logs:TestMetricFilter",
      "sns:Get*",
      "sns:List*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "datapipeline:Describe*",
      "datapipeline:GetPipelineDefinition",
      "datapipeline:ListPipelines",
      "datapipeline:QueryObjects",
      "dynamodb:BatchGetItem",
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:ListTables",
      "dynamodb:Query",
      "dynamodb:Scan",
      "dynamodb:DescribeReservedCapacity",
      "dynamodb:DescribeReservedCapacityOfferings",
      "dynamodb:ListTagsOfResource",
      "dynamodb:DescribeTimeToLive",
      "lambda:ListFunctions",
      "lambda:ListEventSourceMappings",
      "lambda:GetFunctionConfiguration",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:BatchGetItem",
      "dynamodb:BatchWriteItem",
      "dynamodb:CreateTable",
      "dynamodb:DeleteItem",
      "dynamodb:DeleteTable",
      "dynamodb:DescribeTable",
      "dynamodb:DescribeTimeToLive",
      "dynamodb:GetItem",
      "dynamodb:ListTagsOfResource",
      "dynamodb:PutItem",
      "dynamodb:TagResource",
      "dynamodb:UpdateItem",
      "dynamodb:UpdateTable",
      "dynamodb:UpdateTimeToLive",
      "dynamodb:UntagResource",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/${lower(var.module_tenant_namespace)}-*",
      "arn:aws:dynamodb:*:*:table/entsvcs-terraform*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:DescribeStream",
      "dynamodb:GetRecords",
      "dynamodb:GetShardIterator",
      "dynamodb:ListStreams",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/${lower(var.module_tenant_namespace)}-*/stream/*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:DescribeLimits",
      "dynamodb:DescribeReservedCapacity",
      "dynamodb:DescribeReservedCapacityOfferings",
      "dynamodb:ListTables",
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "dynamodb:Query",
      "dynamodb:Scan",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/${lower(var.module_tenant_namespace)}-*",
      "arn:aws:dynamodb:*:*:table/${lower(var.module_tenant_namespace)}-*/index/*",
      "arn:aws:dynamodb:*:*:table/entsvcs-terraform*",
      "arn:aws:dynamodb:*:*:table/entsvcs-terraform*/index/*",
    ]
  }

  statement {
    effect = "Deny"

    actions = [
      "dynamodb:DeleteTable",
      "dynamodb:TagResource",
      "dynamodb:UpdateTable",
      "dynamodb:UntagResource",
    ]

    resources = [
      "arn:aws:dynamodb:*:*:table/entsvcs-terraform*",
    ]
  }

  statement {
    sid    = "AllowCloudWatchSupport"
    effect = "Allow"

    actions = [
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:DeleteAlarms",
    ]

    resources = ["*"]
  }

//s3.tf
  statement {
    sid    = "AllowUserToSeeBucketListInTheConsole"
    effect = "Allow"

    actions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    sid     = "TformRootAndConsumerList"
    effect  = "Allow"
    actions = ["s3:ListBucket"]

    resources = [
      "arn:aws:s3:::${lower(var.module_tenant_namespace)}-*",
      "arn:aws:s3:::entsvcs-terraform*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:prefix"
      values   = ["", "${var.module_tenant_namespace}/"]
    }

    condition {
      test     = "StringEquals"
      variable = "s3:delimiter"
      values   = ["/"]
    }
  }

  statement {
    sid     = "ListTFormStateFolder"
    effect  = "Allow"
    actions = ["s3:ListBucket"]

    resources = [
      "arn:aws:s3:::entsvcs-terraform*",
    ]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"
      values   = ["${var.module_tenant_namespace}/*"]
    }
  }

  statement {
    sid     = "AllowAllS3ActionsInTFormStateFolder"
    effect  = "Allow"
    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::${lower(var.module_tenant_namespace)}-*",
      "arn:aws:s3:::${lower(var.module_tenant_namespace)}-*/*",
      "arn:aws:s3:::entsvcs-terraform*/${var.module_tenant_namespace}/*",
    ]
  }

  statement {
    sid    = "DenyAllS3ActionsInTFormStateFolder"
    effect = "Deny"

    actions = [
      "s3:PutBucket*",
      "s3:PutLifecycle*",
      "s3:PutReplication*",
      "s3:PutAcceler*",
      "s3:DeleteBuck*",
    ]

    resources = [
      "arn:aws:s3:::${lower(var.module_tenant_namespace)}-*/*",
      "arn:aws:s3:::entsvcs-terraform*/${var.module_tenant_namespace}/*",
    ]
  }

  statement {
    sid    = "AllowCopyAmiCrossAcctCrossRegion"
    effect = "Allow"

    actions = [
      "s3:CreateBucket",
      "s3:GetBucketAcl",
      "s3:PutObjectAcl",
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::amis-for-*-in-*",
    ]
  }

//rds.tf
  statement {
    sid       = "AllowRDSDescribe"
    effect    = "Allow"
    actions   = ["rds:Describe*"]
    resources = ["*"]
  }

  statement {
    sid     = "AllowRDSManagementByNamespace"
    effect  = "Allow"
    actions = ["rds:*"]

    resources = [
      "arn:aws:rds:*:*:*:${lower(var.module_tenant_namespace)}.*",
      "arn:aws:rds:*:*:*:${lower(var.module_tenant_namespace)}*",
      "arn:aws:rds:*:*:cluster-pg*",
      "arn:aws:rds:*:*:subgrp:*",
      "arn:aws:rds:*:*:pg*",
    ]
  }
}
