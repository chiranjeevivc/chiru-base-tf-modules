data "aws_iam_policy_document" "presto_pd" {
   statement {
      effect= "Allow"
      resources=["${var.iam_resources_emr_presto_acesss_all}"]
      actions = ["${var.iam_actions_emr_presto_access_all}"]
        }
         statement {
            sid = "VisualEditor3"
            effect= "Allow"
            resources=["${var.iam_resources_emr_presto_acesss_kms}"]
            actions = ["${var.iam_actions_emr_presto_access_kms}"]
        }
        statement {
            sid = "VisualEditor4",
            effect= "Allow",
            resources=["${var.iam_resources_emr_presto_acesss_kms_all}"]
            actions = ["${var.iam_actions_emr_presto_access_kms_all}"]
        }
}
