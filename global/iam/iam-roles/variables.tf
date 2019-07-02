variable "AccountMoniker" {
  type    = "string"
  default = ""
}
variable "role_path" {
  type    = "string"
  default = "/"
}
variable "aws_region" {
  type    = "string"
  default = "us-east-1"
}

variable "aws_account_id" {
  type    = "string"
  default = ""
}

variable "iam_role" {
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

variable "trusted_policy_type" {
  description = "ARNs of AWS entities who can assume these roles"
  default     = []
}

variable "trust_policy_services" {
  description = "Services for Trust Policy Assumption"
  default     = []
}

variable "trust_policy_principals" {
  description = "Principals for Trust Policy Assumption"
  default     = []
}

variable "aws_managed_policies" {
  default = []
}

variable "kms_key_arns" {
  type        = "list"
  description = "list of kms keys to access in other accounts"
  default     = []
}

variable "restricted_buckets" {
  type    = "list"
  default = []
}

variable "bucket_kms_keys" {
  type    = "list"
  default = []
}
