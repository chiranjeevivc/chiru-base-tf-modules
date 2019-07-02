//variables.tf

variable "assumable_roles" {
  type    = "list"
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
