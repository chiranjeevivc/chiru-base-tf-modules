variable "bucket_name" {}
variable "folder_name" {}
variable "kms_key" {}

variable "environment" {}

variable "platform" {}

resource "aws_iam_policy" "policy" {
  name = "svc-${var.environment}-${var.platform}-att-dds-${var.folder_name}"
  path = "/"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Listingalls3buckets",
      "Effect": "Allow",
      "Action": [
        "s3:ListAllMyBuckets",
        "s3:HeadBucket",
        "s3:GetBucketLocation"
      ],
      "Resource": "*"
    },
    {
      "Sid": "Listingparticualarresource",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::${var.bucket_name}"
    },
    {
      "Sid": "Accesstofolderpath",
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListObject",
        "s3:DeleteObject",
        "s3:GetObjectTagging",
        "s3:PutObjectTagging",
        "s3:DeleteObectTagging"
      ],
      "Resource": "arn:aws:s3:::${var.bucket_name}/dds/${var.folder_name}/*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:Generatedatakey*",
        "kms:ReEncrypt*",
        "kms:Describekey*"
      ],
      "Resource": "${var.kms_key}"
    },
    {
      "Effect": "Allow",
      "Action": [
        "kms:ListKeys",
        "kms:ListAliases"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

output "arn" {
  value = "${aws_iam_policy.policy.arn}"
}
