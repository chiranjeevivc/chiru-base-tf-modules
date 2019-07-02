variable "tags" {
  description = "A map of additional tags"
  type        = "map"
  default = {
      "Environment"="skunkworks2018"
      "Requestor"="twitherspoon@deloitte.com"
      "Department"="Cloud Architecture"
      "AppId"="skunkworks2018"
      "AppName"="skunkworks2018"
      "CostCenter"="8675309"
      "ProjectCode"="FY18SkunkWorksEnv"
      "DataClass"="Low"
  }
}

variable "name" {
  description = "Name of EFS"
}

variable "performance_mode" {
  description = "The file system performance mode. Can be either generalPurpose or maxIO"
  type        = "string"
  default     = "generalPurpose"
}

variable "encrypted" {
  description = "If true, the disk will be encrypted"
  type        = "string"
  default     = "false"
}

variable "kms_key_id" {
  description = "ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
  type        = "string"
  default     = ""
}

variable "region" {
  description = "AWS region"
  type        = "string"
  default     = ""
}

variable "security_groups" {
  description = "AWS security group IDs to allow to connect to the EFS"
  type        = "list"
  default     = []
}

variable "subnets" {
  description = "AWS subnet IDs"
  type        = "list"
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = "string"
}
