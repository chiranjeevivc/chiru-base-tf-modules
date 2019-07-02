
//variables for emr_kms_disk_encryption
variable "iam_actions_emr_kms_encryption" {
  default = ["ds:Check*",
  "ds:Describe*",
  "ds:Get*",
  "ds:List*",
  "ds:Verify*",
  "ec2:DescribeNetworkInterfaces",
  "ec2:DescribeSubnets",
  "ec2:DescribeVpcs",
  "sns:ListTopics",
  "sns:GetTopicAttributes",
  "sns:ListSubscriptions",
  "sns:ListSubscriptionsByTopic",
  "kms:*",
  "glue:*",
  "dynamodb:*"
  ]
}


variable "iam_resources_emr_kms_encryption" {
  default = "*"
}

//variables for emr_fullaccess_mapreduces
variable "iam_actions_emr_fullaccess" {
  default = ["elasticmapreduce:*"]
}

variable "iam_resources_emr_fullaccess" {
  default = "*"
}

//variables for emr_ec2_assume_role
/*
variable "iam_actions_emr_ec2_assume_role"{
  default = ["sts:AssumeRole",]
}
variable "iam_identifiers_emr_ec2_assume_role"{
  default = ["ec2.amazonaws.com"]
}


//variables for emr_autoscale_assume_role
variable "iam_actions_emr_autoscale_assume_role"{
  default = ["sts:AssumeRole",]
}


variable "iam_identifiers_emr_autoscale_assume_role"{
  default = ["ec2.amazonaws.com"]
}

//variables for emr_assume_role
variable "iam_actions_emr_assume_role"{
  default = ["sts:AssumeRole",]
}
variable "iam_identifiers_emr_assume_role"{
  default = ["elasticmapreduce.amazonaws.com"]
}
*/

######Variables for presto_emr_cluster######################

##presto-emr-access-policy
variable "iam_resources_emr_presto_acesss_all" {
  default = "*"
}

variable "iam_actions_emr_presto_access_all" {
  default = [
    "cloudwatch:*",
    "dynamodb:*",
    "ec2:Describe*",
    "elasticmapreduce:Describe*",
    "elasticmapreduce:ListBootstrapActions",
    "elasticmapreduce:ListClusters",
    "elasticmapreduce:ListInstanceGroups",
    "elasticmapreduce:ListInstances",
    "elasticmapreduce:ListSteps",
    "rds:Describe*",
    "s3:*",
    "sdb:*",
    "sns:*",
    "sqs:*",
  ]
}

variable "iam_resources_emr_presto_acesss_kms" {
  default = [
    "arn:aws:kms:us-east-1:081417463982:alias/emr-presto",
    "arn:aws:kms:us-east-1:081417463982:alias/bitools",
    "arn:aws:kms:us-east-1:081417463982:key/8af8bb14-d5bb-4bfe-b61c-1afd726ae23f",
    "arn:aws:kms:us-east-1:081417463982:key/d4a59497-1530-4c97-b9df-a8a39bbcf486",
  ]
}

variable "iam_actions_emr_presto_access_kms" {
  default = [
    "kms:ImportKeyMaterial",
    "kms:Decrypt",
    "kms:ListKeyPolicies",
    "kms:ListRetirableGrants",
    "kms:GetKeyPolicy",
    "kms:GenerateDataKeyWithoutPlaintext",
    "kms:ListResourceTags",
    "kms:DeleteImportedKeyMaterial",
    "kms:ListGrants",
    "kms:GetParametersForImport",
    "kms:TagResource",
    "kms:Encrypt",
    "kms:GetKeyRotationStatus",
    "kms:DescribeKey",
  ]
}

variable "iam_resources_emr_presto_acesss_kms_all" {
  default = "*"
}

variable "iam_actions_emr_presto_access_kms_all" {
  default = [
    "kms:ListKeys",
    "kms:GenerateRandom",
    "kms:ListAliases",
    "kms:GenerateDataKey",
    "kms:ReEncryptTo",
    "kms:ReEncryptFrom",
  ]
}

##presto-access-prod-kms-policy

variable "iam_resources_emr_presto_kms_access_key" {
  default = ["arn:aws:kms:us-east-1:547895166865:key/7537f4d2-d64c-4205-bb42-77749f5f1f51"]
}

variable "iam_actions_emr_presto_kms_access_key" {
  default = [
    "kms:Encrypt",
    "kms:Decrypt",
    "kms:ReEncrypt*",
    "kms:GenerateDataKey*",
    "kms:DescribeKey",
  ]
}

variable "iam_resources_emr_presto_kms_attach_resources" {
  default = ["arn:aws:kms:us-east-1:547895166865:key/7537f4d2-d64c-4205-bb42-77749f5f1f51"]
}

variable "iam_actions_emr_presto_kms_attach_resources" {
  default = [
    "kms:CreateGrant",
    "kms:ListGrants",
    "kms:RevokeGrant",
  ]
}

######Variables for data_eng_emr_cluster######################

variable "iam_resources_emr_secrets_manager" {
  default = ["arn:aws:secretsmanager:us-east-1:594349222397:secret:macdev/admin/public-Xw3Kve"]
}

variable "iam_actions_emr_secrets_manager" {
  default = [
    "secretsmanager:GetSecretValue",
    "secretsmanager:DescribeSecret",
    "secretsmanager:ListSecrets",
  ]
}


variable "iam_resources_emr_s3_read_only" {
  default = ["arn:aws:s3:::pr-mac-att-5478-us-east-1/*",
    "arn:aws:s3:::pr-mac-att-5478-us-east-1",
  ]
}

variable "iam_actions_emr_s3_read_only" {
  default = [
    "s3:Get*",
    "s3:List*",
  ]
}

variable "iam_resources_emr_s3_read_write" {
  default = ["arn:aws:s3:::pr-mac-attdev-5478-us-east-1/*",
    "arn:aws:s3:::pr-mac-attdev-5478-us-east-1",
  ]
}

variable "iam_actions_emr_s3_read_write" {
  default = ["s3:*"]
}

variable "iam_actions_emr_cross_kms" {
  default = ["kms:*"]
}

variable "iam_resources_emr_cross_kms" {
  default = ["arn:aws:kms:us-east-1:547895166865:key/7537f4d2-d64c-4205-bb42-77749f5f1f51",
    "arn:aws:kms:us-east-1:547895166865:key/fb631a4e-2685-42f4-a252-9e2a5d51b0d7",
  ]

}

variable "iam_actions_ssm_policy" {
  default = [
    "ssm:DescribeParameters",
    "ssm:GetParameters"
         ]
}

variable "iam_resources_ssm_policy" {
  default = "*"
}
