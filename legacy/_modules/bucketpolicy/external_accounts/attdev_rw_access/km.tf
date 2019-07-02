variable "s3_bucketName" {}
variable "kms_key_id" {}
variable "s3_vpc_endpoint" {}
variable "s3_vpc_endpoint2" {}
variable "s3_vpc_endpoint3" {}

resource "aws_s3_bucket_policy" "kmbucketpolicy" {
  bucket = "pr-mac-attdev-5478-us-east-1"

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
                "arn:aws:s3:::pr-mac-attdev-5478-us-east-1",
                "arn:aws:s3:::pr-mac-attdev-5478-us-east-1/*"
            ],
            "Condition": {
                "Bool": {
                    "aws:SecureTransport": "false"
                }
            }
        },
        {
            "Sid": "IPDeny",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::pr-mac-attdev-5478-us-east-1/*",
            "Condition": {
                "NotIpAddress": {
                    "aws:SourceIp": [
                        "32.65.184.36/32",
                        "32.65.184.37/32",
                        "32.65.184.38/32",
                        "32.65.184.39/32",
                        "32.65.184.40/32",
                        "32.65.184.41/32",
                        "32.65.184.42/32",
                        "32.65.184.43/32",
                        "32.65.184.44/32",
                        "32.65.184.45/32",
                        "32.65.184.46/32",
                        "32.65.184.47/32"
                    ]
                },
                "StringNotEquals": {
                    "aws:sourceVpce": [
                        "${var.s3_vpc_endpoint}",
                        "${var.s3_vpc_endpoint2}"
                    ]
                }
            }
        },
 {
    "Sid": "AllowCrossAccountAccessViaVPCEndpoints",
    "Effect": "Allow",
    "Principal": {
        "AWS": [
            "arn:aws:iam::594349222397:root"
        ]
    },
    "Action": [
        "s3:*"
    ],
    "Resource": [
        "arn:aws:s3:::pr-mac-attdev-5478-us-east-1",
        "arn:aws:s3:::pr-mac-attdev-5478-us-east-1/*"
    ],
    "Condition": {
        "StringEquals": {
            "aws:sourceVpce": [
                "${var.s3_vpc_endpoint2}"
            ]
        }
    }
},
{
    "Sid": "AllowCrossAccountAccessViaVPCEndpoints",
    "Effect": "Allow",
    "Principal": {
        "AWS": [
            "arn:aws:iam::695019450051:root"
        ]
    },
    "Action": [
        "s3:*"
    ],
    "Resource": [
        "arn:aws:s3:::pr-mac-attdev-5478-us-east-1",
        "arn:aws:s3:::pr-mac-attdev-5478-us-east-1/*"
    ],
    "Condition": {
        "StringEquals": {
            "aws:sourceVpce": [
                "${var.s3_vpc_endpoint3}"
            ]
        }
    }
}

    ]
}
POLICY
}
