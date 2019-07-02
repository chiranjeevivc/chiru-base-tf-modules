data "aws_iam_policy_document" "cross-kms-policy_pd" {
    statement {
       sid = "CrossMKS"
       effect= "Allow"
       resources=["${var.iam_resources_emr_cross_kms}"]
       actions = ["${var.iam_actions_emr_cross_kms}"]
          }

}
