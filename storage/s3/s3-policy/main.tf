resource "aws_s3_bucket_policy" "policy" {
  count    = "${var.create_policy ? 1 : 0}"
  bucket   = "${var.s3_bucketName}"
  #policy = "${data.aws_iam_policy_document.s3-general.json}"
  policy =<<POLICY
{
 "Version": "2012-10-17",
 "Id": "MYBUCKETPOLICY",
 "Statement": [
   {
     "Sid": "DenyNonSSLConnections",
     "Effect": "Deny",
     "Principal": { "AWS": "*" },
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
             "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_key_arn}"
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
   }
 ]
}
POLICY
}


resource "aws_s3_bucket_policy" "policy_with_vpc_endpoints" {
  count    = "${var.create_policy_with_vpc_endpoints ? 1 : 0}"
  bucket   = "${var.s3_bucketName}"
  #policy = "${data.aws_iam_policy_document.s3-general.json}"
  policy =<<POLICY
{
 "Version": "2012-10-17",
 "Id": "MYBUCKETPOLICY",
 "Statement": [
   {
     "Sid": "DenyNonSSLConnections",
     "Effect": "Deny",
     "Principal": { "AWS": "*" },
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
             "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_key_arn}"
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
     "Sid": "DenyNonApprovedIPAddressesVPCEndpoints",
     "Effect": "Deny",
     "Principal": "*",
     "Action": "s3:*",
     "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
     "Condition": {
         "NotIpAddress": {
             "aws:SourceIp": ${jsonencode(var.source_ip)}
         },
         "StringNotEquals": {
             "aws:sourceVpce": ${jsonencode(var.vpc_endpoints)}
         }
     }
   },
   {
     "Sid": "AllowCrossAccountAccessViaVPCEndpoints",
     "Effect": "Allow",
     "Principal":{ "AWS": ${jsonencode(var.account_arn)}  },
     "Action": ["s3:GetObject","s3:ListBucket"],
     "Resource": [
         "arn:aws:s3:::${var.s3_bucketName}",
         "arn:aws:s3:::${var.s3_bucketName}/*"
     ],
     "Condition": {
         "StringEquals": {
              "aws:sourceVpce": ${jsonencode(var.vpc_endpoints_cross)}
         }
     }
   }

 ]
}
POLICY
}

resource "aws_s3_bucket_policy" "policy_with_vpc_endpoints_partners" {
  count    = "${var.create_policy_with_vpc_endpoints_partners ? 1 : 0}"
  bucket   = "${var.s3_bucketName}"
  #policy = "${data.aws_iam_policy_document.s3-general.json}"
  policy =<<POLICY
{
 "Version": "2012-10-17",
 "Id": "MYBUCKETPOLICY",
 "Statement": [
   {
     "Sid": "DenyNonSSLConnections",
     "Effect": "Deny",
     "Principal": { "AWS": "*" },
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
             "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_key_arn}"
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
     "Sid": "DenyNonApprovedIPAddressesVPCEndpoints",
     "Effect": "Deny",
     "Principal": "*",
     "Action": "s3:*",
     "Resource": "arn:aws:s3:::${var.s3_bucketName}/*",
     "Condition": {
         "NotIpAddress": {
             "aws:SourceIp": ${jsonencode(var.source_ip)}
         },
         "StringNotEquals": {
             "aws:sourceVpce": ${jsonencode(var.vpc_endpoints)}
         }
     }
   },
   {
     "Sid": "AllowCrossAccountAccessViaVPCEndpointsMAC",
     "Effect": "Allow",
     "Principal":{ "AWS": ${jsonencode(var.mac_account_arn)}  },
     "Action": ["s3:GetObject","s3:ListBucket"],
     "Resource": [
         "arn:aws:s3:::${var.s3_bucketName}",
         "arn:aws:s3:::${var.s3_bucketName}/*"
     ],
     "Condition": {
         "StringEquals": {
              "aws:sourceVpce": ${jsonencode(var.mac_vpc_endpoints_cross)}
         }
     }
   },
   {
     "Sid": "AllowCrossAccountAccessViaVPCEndpointsTurner",
     "Effect": "Allow",
     "Principal":{ "AWS": ${jsonencode(var.turner_account_arn)}  },
     "Action": ["s3:ListBucket"],
     "Resource": [
         "arn:aws:s3:::${var.s3_bucketName}",
         "arn:aws:s3:::${var.s3_bucketName}/*"
     ],
     "Condition": {
         "StringEquals": {
              "aws:sourceVpce": ${jsonencode(var.turner_vpc_endpoints_cross)}
         }
     }
   },
   {
     "Sid": "AllowCrossAccountAccessTurner",
     "Effect": "Allow",
     "Principal":{ "AWS": ${jsonencode(var.turner_account_arn)}  },
     "Action": ["s3:GetObject","s3:GetObjectTagging"],
     "Resource": ${jsonencode(var.turner_folders)},
     "Condition": {
         "StringEquals": {
              "aws:sourceVpce": ${jsonencode(var.turner_vpc_endpoints_cross)}
         }
     }
   }

 ]
}
POLICY
}



resource "aws_s3_bucket_policy" "policy_logging" {
  count    = "${var.create_policy_logging ? 1 : 0}"
  bucket   = "${var.s3_bucketName}"
  #policy = "${data.aws_iam_policy_document.s3-general.json}"
  policy =<<POLICY
{
 "Version": "2012-10-17",
 "Id": "MYBUCKETPOLICY",
 "Statement": [
   {
     "Sid": "DenyNonSSLConnections",
     "Effect": "Deny",
     "Principal": { "AWS": "*" },
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
             "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_key_arn}"
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
       "Sid": "AWSCloudTrailAclCheck",
       "Effect": "Allow",
       "Principal": {
         "Service": "cloudtrail.amazonaws.com"
       },
       "Action": "s3:GetBucketAcl",
       "Resource": "arn:aws:s3:::${var.s3_bucketName}"
   },
   {
       "Sid": "AWSCloudTrailWrite",
       "Effect": "Allow",
       "Principal": {
         "Service": "cloudtrail.amazonaws.com"
       },
       "Action": "s3:PutObject",
      "Resource": ${jsonencode(var.cloudtrail_resources)},
       "Condition": {
           "StringEquals": {
               "s3:x-amz-acl": "bucket-owner-full-control"
           }
       }
   }
 ]
}
POLICY
}
