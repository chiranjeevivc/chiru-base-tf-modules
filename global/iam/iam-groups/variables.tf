variable "AccountMoniker" {
  type    = "string"
  default = ""
}

variable "aws_region" {
  type    = "string"
  default = "us-east-1"
}

variable "aws_account_id" {
  type    = "string"
  default = ""
}

variable "iam_group" {
  type    = "string"
  default = ""
}

variable "power_user_policies" {
  type    = "list"
  default = []
}

variable "general_policies" {
  type    = "list"
  default = []
}

variable "assumable_roles" {
  type    = "list"
  default = []
}

variable "emr_managed_policies" {
  type    = "list"
  default = []
}

variable "aws_managed_policies" {
  default = []
}

variable "restricted_buckets" {
  type    = "list"
  default = []
}

variable "bucket_kms_keys" {
  type    = "list"
  default = []
}

variable "existing_group" {
  default = false
}

variable "group_name" {
  default = ""
}

variable "users" {
  default = ""
}

variable "create_group" {
  default = false
}

variable "group" {
  default = ""
}

variable "create_group_membership" {
  default = false
}

variable "path_group" {
  default = "/"
}

variable "restricted_buckets" {
  type    = "list"
  default = []
}

variable "bucket_kms_keys" {
  type    = "list"
  default = []
}
