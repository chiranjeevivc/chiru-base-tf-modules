variable "s3_bucketName" {}
variable "kms_key_id" {}

variable "s3_vpc_endpoint" {}
variable "s3_vpc_endpoint2" {}

resource "aws_s3_bucket_policy" "kmbucketpolicy" {
  bucket = "${var.s3_bucketName}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "PutObjPolicy",
    "Statement": [
        {
            "Sid": "SSLOnlyAccess",
            "Effect": "Deny",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.s3_bucketName}",
                "arn:aws:s3:::${var.s3_bucketName}/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "DenyIncorrectEncryptionKey",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_key_id}"
                }
            }
        },
        {
            "Sid": "DenyUnEncryptedObjectUploads",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "Null": {
                    "s3:x-amz-server-side-encryption": "true"
                }
            }
        },
        {
            "Sid": "IPDeny",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
            "Condition": {
                "StringNotEquals": {
                    "aws:sourceVpce": [
                        "${var.s3_vpc_endpoint}",
                        "${var.s3_vpc_endpoint2}"
                    ]
                }
            }
        }
    ]
}
POLICY
}
