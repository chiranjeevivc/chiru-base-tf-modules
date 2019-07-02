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

variable "iam_user" {
  type    = "string"
  default = ""
}

variable "user_create_access_key" {
  default = false
}
variable "iam_user_path" {
  description = "Path in which to create the user."
  default = "/"
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

<<<<<<< HEAD
=======
variable "iam_user_path" {
  description = "Path in which to create the user."
  default     = "/"
}
>>>>>>> 77ca92c800bd67bd261f2bef6e3abd9a4130bb64

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
