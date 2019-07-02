data "aws_iam_policy_document" "secretsmanager_pd" {
    statement {
       sid = "EmrSecretManagerPolicy"
       effect= "Allow"
       resources=["${var.iam_resources_emr_secrets_manager}"]
       actions = ["${var.iam_actions_emr_secrets_manager}"]
          }
}
