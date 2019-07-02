//output.tf

output "json_out_map" {
  value = "${
        map(
            "cross-kms-policy", "${data.aws_iam_policy_document.cross-kms-policy_pd.json}",
            "fullaccess", "${data.aws_iam_policy_document.fullaccess_pd.json}",
            "kms-disk-encryption", "${data.aws_iam_policy_document.kms-disk-encryption_pd.json}",
            "presto", "${data.aws_iam_policy_document.presto_pd.json}",
            "prod-kms-access", "${data.aws_iam_policy_document.prod-kms-access_pd.json}",
            "s3", "${data.aws_iam_policy_document.s3_pd.json}",
            "secretsmanager", "${data.aws_iam_policy_document.secretsmanager_pd.json}",
            "ssm-policy", "${data.aws_iam_policy_document.ssm-policy_pd.json}"
        )
    }"
}

output "json_size_map" {
  value = "${
        map(
            "cross-kms-policy", "${length(data.aws_iam_policy_document.cross-kms-policy_pd.json)}",
            "fullaccess", "${length(data.aws_iam_policy_document.fullaccess_pd.json)}",
            "kms-disk-encryption", "${length(data.aws_iam_policy_document.kms-disk-encryption_pd.json)}",
            "presto", "${length(data.aws_iam_policy_document.presto_pd.json)}",
            "prod-kms-access", "${length(data.aws_iam_policy_document.prod-kms-access_pd.json)}",
            "s3", "${length(data.aws_iam_policy_document.s3_pd.json)}",
            "secretsmanager", "${length(data.aws_iam_policy_document.secretsmanager_pd.json)}",
            "ssm-policy", "${length(data.aws_iam_policy_document.ssm-policy_pd.json)}"

        )
    }"
}
