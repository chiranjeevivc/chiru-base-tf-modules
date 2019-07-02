# variable "tags" {
#   type = "map"
#   default = {}
# }
#
variable "name"{
  default = ""
}

variable "kms_key_arn"{}

#
# variable "iam_key_users_permissions_identifiers"{
#   type = "list"
#   default= ["arn:aws:iam::081417463982:root"]
#   #default="*"
# }
#
# variable "iam_key_users_permissions_actions"{
#   type = "list"
#   default=["kms:*"]
# }
# variable "iam_key_users_permissions_resources"{
#   type = "list"
#   default=["*"]
# }
#
# variable "iam_users_key_administrators_access_identifiers"{
#   type = "list"
#   #default=["arn:aws:iam::081417463982:user/sm856a"]
#   default=["*"]
# }
#
# variable "iam_users_key_administrators_access_actions"{
#   type = "list"
#   default=[
#     "kms:Create*",
#     "kms:Describe*",
#     "kms:Enable*",
#     "kms:List*",
#     "kms:Put*",
#     "kms:Update*",
#     "kms:Revoke*",
#     "kms:Disable*",
#     "kms:Get*",
#     "kms:Delete*",
#     "kms:TagResource",
#     "kms:UntagResource",
#     "kms:ScheduleKeyDeletion",
#     "kms:CancelKeyDeletion"
#   ]
# }
# variable "iam_users_key_administrators_access_resources"{
#   type = "list"
#   default=["*"]
# }
#
# #need to pull from iam
# variable "iam_key_users"{
#   type = "list"
# #  default=[ "arn:aws:iam::081417463982:role/auto_emr_ec2_role",
# #            "arn:aws:iam::081417463982:role/auto_emr_role","arn:aws:iam::081417463982:root"]
# }
# variable "iam_key_users_actions"{
#   type = "list"
#   default=[
#     "kms:Encrypt",
#     "kms:Decrypt",
#     "kms:ReEncrypt*",
#     "kms:GenerateDataKey*",
#     "kms:DescribeKey",
#     "kms:CreateGrant",
#     "kms:GenerateDataKeyWithoutPlaintext"
#   ]
# }
#
# variable "iam_key_users_resources"{
#   type = "list"
#   default=["*"]
# }
#
# #pull from iam module
# variable "grant_resource_for_key"{
#   type = "list"
# #    default=["arn:aws:iam::081417463982:role/auto_emr_ec2_role",
# #            "arn:aws:iam::081417463982:role/auto_emr_role","arn:aws:iam::081417463982:root"]
# }
#
# variable "grant_resource_for_key_actions" {
#   type = "list"
#   default=
#     ["kms:CreateGrant",
#     "kms:ListGrants",
#     "kms:RevokeGrant"]
#
# }
# variable "grant_resource_for_key_resources"{
#   type = "list"
#   default=["*"]
# }
#
# #variable "emr_kms_key_alias_name" {}
#
#
# /*
# variable "iam_key_users_permissions_identifiers"{
#   type = "list"
#   default=["arn:aws:iam::594349222397:root"]
# }
#
# variable "iam_users_key_administrators_access"{
#   type = "list"
#   default=["arn:aws:iam::594349222397:root"]
# }
#
# variable "iam_key_users"{
#   type = "list"
#   default=[]
# }
#
# variable "grant_resource_for_key"{
#   type = "list"
#   default=[]
# }
# */
# variable "emr_kms_key_alias_name"{}
# variable "name" {}
