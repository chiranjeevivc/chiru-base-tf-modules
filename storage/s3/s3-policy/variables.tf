variable "s3_bucketName" {}
variable "create_policy"{
  default = false
}
variable "create_policy_logging"{
  default = false
}
variable "create_policy_with_vpc_endpoints"{
  default = false
}
variable "kms_key_arn"{}
variable "source_ip"{
  type = "list"
  default = []
}
variable "vpc_endpoints"{
  type = "list"
  default = []
}

variable "account_arn"{
  type = "list"
  default = []
}
variable "vpc_endpoints_cross"{
  type = "list"
  default = []
}



variable "create_policy_with_vpc_endpoints_partners" {
  default = false
}
variable "mac_account_arn" {
  type = "list"
  default = []
}
variable "mac_vpc_endpoints_cross"{
  type = "list"
  default = []
}

variable "turner_account_arn"{
  type = "list"
  default = []
}

variable "turner_vpc_endpoints_cross"{
  type = "list"
  default = []
}
variable "cloudtrail_resources"{
  type = "list"
  default = []
}


variable "turner_folders"{
  type = "list"
  default = []
}
