variable "logS3BucketId" {}

#variable "kms_key_arn" {}

resource "aws_cloudtrail" "main" {
  name                       = "ManagementEvents"
  s3_bucket_name             = "${var.logS3BucketId}"
  is_multi_region_trail      = true
  enable_log_file_validation = true

  # kms_key_id                 = "${var.kms_key_arn}"

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::${var.logS3BucketId}/"]
    }
  }
}
