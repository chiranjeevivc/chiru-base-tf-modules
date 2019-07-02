// Special bucket for logging that needs slightly non standard policies.

variable "environment" {}
variable "foundation" {}
variable "costcenter" {}
variable "appfamily" {}
variable "platform" {}
variable "owner" {}
variable "aws_region" {}

variable "bkt_versioning" {
  default = false
}

variable "bkt_mfadelete" {
  default = false
}

data "aws_caller_identity" "current" {}

#####
# Bucket
# 
resource "aws_s3_bucket" "logging" {
  bucket = "logging-${var.environment}-${var.platform}-${var.aws_region}"
  acl    = "log-delivery-write"

  tags {
    Name        = "logging-${var.environment}-${var.platform}-${var.aws_region}"
    environment = "${var.environment}"
    foundation  = "${var.foundation}"
    costcenter  = "${var.costcenter}"
    appfamily   = "${var.appfamily}"
    owner       = "${var.owner}"
    mfa_delete  = "${var.bkt_mfadelete}"
    terraform   = "True"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled    = "${var.bkt_versioning}"
    mfa_delete = "${var.bkt_mfadelete}"
  }
}

#####
# Bucket Policy
#

module "loggings3bucketpolicy" {
  source        = "../../bucketpolicy/logging_policy"
  s3_bucketName = "${aws_s3_bucket.logging.id}"
}

output "id" {
  value = "${aws_s3_bucket.logging.id}"
}
