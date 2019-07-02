data "aws_iam_policy_document" "prod-kms-access_pd" {
   statement {
      sid= "AllowUseOfTheKeyInProd"
      effect= "Allow"
      resources=["${var.iam_resources_emr_presto_kms_access_key}"]
      actions = ["${var.iam_actions_emr_presto_kms_access_key}"]
        }
         statement {
            sid = "AllowAttachmentOfPersistentResourcesInProd"
            effect= "Allow"
            resources=["${var.iam_resources_emr_presto_kms_attach_resources}"]
            actions = ["${var.iam_actions_emr_presto_kms_attach_resources}"]
            condition {
			      test = "Bool"
			      variable = "kms:GrantIsForAWSResource"
			      values = ["true"]
		       }
      }

}
