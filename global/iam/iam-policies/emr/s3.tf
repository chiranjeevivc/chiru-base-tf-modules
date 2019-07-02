data "aws_iam_policy_document" "s3_pd" {
    statement {
       sid = "EmrS3ReadOnlyPolicy"
       effect= "Allow"
       resources=["${var.iam_resources_emr_s3_read_only}"]
       actions = ["${var.iam_actions_emr_s3_read_only}"]
    }
    statement {
       sid = "EmrS3ReadandWritePolicy"
       effect= "Allow"
       resources=["${var.iam_resources_emr_s3_read_write}"]
       actions = ["${var.iam_actions_emr_s3_read_write}"]
      }
}
