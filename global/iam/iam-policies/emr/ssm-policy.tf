data "aws_iam_policy_document" "ssm-policy_pd" {
    statement {
       sid = "EmrSSMPolicy"
       effect= "Allow"
       actions =  ["${var.iam_actions_ssm_policy}"]
       resources= ["${var.iam_resources_ssm_policy}"]
    }
}
