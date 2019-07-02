
#s3 bucket with kms
resource "aws_s3_bucket" "s3_bucket" {
  bucket                 = "${var.bucket}"
  acl                    = "${var.acl}"
  tags                   = "${var.tags}"
  force_destroy          = "${var.force_destroy}"
  tags                   = "${var.tags}"
  #uncomment if needed
  #acceleration_status    = "${var.acceleration_status}"
  #request_payer          = "${var.request_payer}"
  versioning = "${var.versioning}"
  lifecycle_rule = "${var.lifecycle_rule}"
  logging = "${var.logging}"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "${var.sse_algorithm}" #either aws:kms or AES256
        kms_master_key_id = "${var.kms_key_arn}" #if kms- should I create kms here or outside?
      }
    }
  }
}

resource "aws_s3_bucket_notification" "bucket_notification_existing_sns" {
  #flag
  count = "${var.create_s3_notification && var.existing_sns_notification ? 1 : 0}"
  bucket = "${aws_s3_bucket.s3_bucket.id}"
  topic {
    #id             = "${var.id}"
    #topic_arn = "${aws_sns_topic.s3-topic.arn}"
    topic_arn      = "${var.topic_arn}"
    events         = "${var.events}"
    filter_prefix  = "${var.filter_prefix}"
    filter_suffix  = "${var.filter_suffix}"
  }
}

resource "aws_s3_bucket_notification" "bucket_notification_new_sns" {
  #flag
  count = "${var.create_s3_notification && var.create_sns_notification ? 1 : 0}"
  bucket = "${aws_s3_bucket.s3_bucket.id}"
  topic {
    #id             = "${var.id}"
    topic_arn = "${aws_sns_topic.s3-topic.arn}"
    #topic_arn      = "${var.topic_arn}"
    events         = "${var.events}"
    filter_prefix  = "${var.filter_prefix}"
    filter_suffix  = "${var.filter_suffix}"
  }
}


resource "aws_sns_topic" "s3-topic" {
  count = "${var.create_s3_notification && var.create_sns_notification ? 1 : 0}"
  name = "${var.sns_topic_name}"
  policy = <<POLICY
{
    "Version":"2008-10-17",
    "Id": "SNS-S3Topic-Policy",
    "Statement":[
      {
        "Effect": "Allow",
        "Sid": "SNSPolicy",
        "Principal": {
            "Service": "s3.amazonaws.com"
            },
        "Action": "SNS:Publish",
        "Resource": ${jsonencode(var.sns_topic_resource)},
        "Condition":{
            "ArnLike":{"aws:SourceArn":"${aws_s3_bucket.s3_bucket.arn}"}
        }
      },
      {
        "Effect": "Allow",
        "Sid": "SNSSubscribers",
        "Principal":{ "AWS": ${jsonencode(var.sns_topic_subscription_principal)}  },
        "Action": [
            "SNS:Subscribe",
            "SNS:Receive"
          ],
        "Resource": ${jsonencode(var.sns_topic_resource)}
      }
    ]
}
POLICY
}



resource "aws_s3_bucket_notification" "bucket_notification_lambda" {
  #flag
  count = "${var.create_s3_notification && var.lambda_notification ? 1 : 0}"
  bucket = "${aws_s3_bucket.s3_bucket.id}"

  lambda_function {
      #lambda_function_arn = "${aws_lambda_function.func.arn}"
      lambda_function_arn = "${var.lambda_function}"
      events              = "${var.events}"
      #events              = ["s3:ObjectCreated:*"]
      #filter_prefix       = "AWSLogs/"
      filter_prefix       = "${var.filter_prefix}"
      #filter_suffix       = ".log"
      filter_suffix       = "${var.filter_suffix}"
    }
}

#one with sns

module "s3-bucket-policy" {
  source                            =   "../s3-policy/"
  s3_bucketName                     =   "${aws_s3_bucket.s3_bucket.id}"
  create_policy                     =   "${var.create_policy}"
  create_policy_logging             =   "${var.create_policy_logging}"
  create_policy_with_vpc_endpoints  =   "${var.create_policy_with_vpc_endpoints}"
  kms_key_arn                       =   "${var.kms_key_arn}"
  source_ip                         =   "${var.source_ip}"
  vpc_endpoints                     =   "${var.vpc_endpoints}"
  vpc_endpoints_cross               =   "${var.vpc_endpoints_cross}"
  account_arn                       =   "${var.account_arn}"
  create_policy_with_vpc_endpoints_partners  = "${var.create_policy_with_vpc_endpoints_partners}"
  mac_account_arn                  = "${var.mac_account_arn}"
  mac_vpc_endpoints_cross          = "${var.mac_vpc_endpoints_cross}"
  turner_account_arn               = "${var.turner_account_arn}"
  turner_vpc_endpoints_cross       =  "${var.turner_vpc_endpoints_cross}"
  turner_folders                   =  "${var.turner_folders}"
  cloudtrail_resources =  "${var.cloudtrail_resources}"

}


/*
#created only if s3 bucket with kms variable is true
resource "aws_kms_key" "kms_key" {
  #option as well. need to add policy
  description             = "Key for s3 buckey"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
  tags                    = "${var.tags}"
}

resource "aws_kms_alias" "key_name" {
  name               = "alias/${var.name}"
  target_key_id      = "${aws_kms_key.kms_key.key_id}"

}
*/
