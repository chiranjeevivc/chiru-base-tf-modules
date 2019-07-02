variable "bucket" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
  default= "tf-test-bucket"
}

variable "name" {
  description = "The name of the kms key."
}


variable "versioning"{
  default = []
  type = "list"
}

variable "lifecycle_rule"{
  default = []
  type = "list"
}

variable "logging"{
  default = []
  type = "list"
}


variable "acl" {
  description = "The canned ACL to apply"
  default = "private"
}


variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = false
}


variable "tags" {
  description = "Specifies object tags key and value."
  type = "map"
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

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  default = "aws:kms"
}

##variables for s3 bucket notifications
variable "create_s3_notification" {
  default = false
}
variable "create_sns_notification" {
  default = false
}
variable "existing_sns_notification" {
  default = false
}
variable "lambda_notification" {
  default = false
}

variable "id" {
  default = ""
}

variable "topic_arn" {
  default = ""
}
variable "lambda_function" {
  default = ""
}

variable "events" {
  type = "list"
  default = ["s3:ObjectCreated:*"]
}


variable "filter_prefix" {
  default = ""
}

variable "filter_suffix" {
  default = ""
}

variable "kms_key_id" {
default = ""
}
variable "kms_key_arn" {
default = ""
}
/*  Uncomment if needed
variable "acceleration_status" {
  description = "Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended."
}

variable "request_payer" {
  description = "pecifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information."
}
*/


####variables for kms key
/*
variable "deletion_window_in_days" {
  default = "30"
}

variable "enable_key_rotation" {
  default = false
}
*/
###variables for s3_bucket_policy

variable "create_policy"{
  default = false
}
variable "create_policy_logging"{
  default = false
}
variable "create_policy_with_vpc_endpoints"{
  default = false
}
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

variable "cloudtrail_resources"{
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


variable "turner_folders"{
  type = "list"
  default = []
}

##sns topic policy
variable "sns_topic_resource"{
  type = "list"
  default = []
}

variable "sns_topic_name"{
  default = ""
}

variable "sns_topic_subscription_principal"{
  type = "list"
  default = []
}
