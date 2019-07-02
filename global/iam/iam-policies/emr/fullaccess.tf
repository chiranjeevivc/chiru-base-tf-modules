data "aws_iam_policy_document" "fullaccess_pd" {
     statement {
         actions = ["${var.iam_actions_emr_fullaccess}"]
         resources = ["${var.iam_resources_emr_fullaccess}"]
         effect= "Allow"
         sid= ""
       }
   }
