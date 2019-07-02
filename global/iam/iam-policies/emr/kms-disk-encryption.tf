data "aws_iam_policy_document" "kms-disk-encryption_pd" {
     statement {
         actions = ["${var.iam_actions_emr_kms_encryption}"]
         resources = ["${var.iam_resources_emr_kms_encryption}"]
         effect= "Allow"
         sid= "EmrDiskEncryptionPolicy"
       }
   }
