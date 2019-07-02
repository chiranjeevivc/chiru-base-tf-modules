//output.tf

output "json_out_map" {
  value = "${
        map(
            "apigateway", "${data.aws_iam_policy_document.apigateway_pd.json}",
            "base", "${data.aws_iam_policy_document.base_pd.json}",
            "cloudwatchlogs", "${data.aws_iam_policy_document.cloudwatchlogs_pd.json}",
            "cognito", "${data.aws_iam_policy_document.cognito_pd.json}",
            "dynamodb", "${data.aws_iam_policy_document.dynamodb_pd.json}",
            "ec2", "${data.aws_iam_policy_document.ec2_pd.json}",
            "fulladmin", "${data.aws_iam_policy_document.fulladmin_pd.json}",
            "iam", "${data.aws_iam_policy_document.iam_pd.json}",
            "iot", "${data.aws_iam_policy_document.iot_pd.json}",
            "lambda", "${data.aws_iam_policy_document.lambda_pd.json}",
            "rds", "${data.aws_iam_policy_document.rds_pd.json}",
            "s3", "${data.aws_iam_policy_document.s3_pd.json}",
            "sns", "${data.aws_iam_policy_document.sns_pd.json}",
            "storage", "${data.aws_iam_policy_document.storage_pd.json}",
            "iam_passrole", "${data.aws_iam_policy_document.iam_passrole_pd.json}",
            "eks", "${data.aws_iam_policy_document.eks_pd.json}",
            "kms_keys", "${data.aws_iam_policy_document.kms_keys_pd.json}",
            "iam_cp", "${data.aws_iam_policy_document.iam_cp_pd.json}",
            "cwe", "${data.aws_iam_policy_document.cwe_pd.json}",
            "emr", "${data.aws_iam_policy_document.emr_pd.json}",
            "infra_admin", "${data.aws_iam_policy_document.infra_admin_pd.json}"

        )
    }"
}

output "json_size_map" {
  value = "${
        map(
            "apigateway", "${length(data.aws_iam_policy_document.apigateway_pd.json)}",
            "base", "${length(data.aws_iam_policy_document.base_pd.json)}",
            "cloudwatchlogs", "${length(data.aws_iam_policy_document.cloudwatchlogs_pd.json)}",
            "cognito", "${length(data.aws_iam_policy_document.cognito_pd.json)}",
            "dynamodb", "${length(data.aws_iam_policy_document.dynamodb_pd.json)}",
            "ec2", "${length(data.aws_iam_policy_document.ec2_pd.json)}",
            "fulladmin", "${length(data.aws_iam_policy_document.fulladmin_pd.json)}",
            "iam", "${length(data.aws_iam_policy_document.iam_pd.json)}",
            "iot", "${length(data.aws_iam_policy_document.iot_pd.json)}",
            "lambda", "${length(data.aws_iam_policy_document.lambda_pd.json)}",
            "rds", "${length(data.aws_iam_policy_document.rds_pd.json)}",
            "s3", "${length(data.aws_iam_policy_document.s3_pd.json)}",
            "sns", "${length(data.aws_iam_policy_document.sns_pd.json)}",
            "storage", "${length(data.aws_iam_policy_document.storage_pd.json)}",
            "iam_passrole", "${length(data.aws_iam_policy_document.iam_passrole_pd.json)}",
            "eks", "${length(data.aws_iam_policy_document.eks_pd.json)}",
            "kms_keys", "${length(data.aws_iam_policy_document.kms_keys_pd.json)}",
            "iam_cp", "${length(data.aws_iam_policy_document.iam_cp_pd.json)}",
            "cwe", "${length(data.aws_iam_policy_document.cwe_pd.json)}",
            "emr", "${length(data.aws_iam_policy_document.emr_pd.json)}",
            "infra_admin", "${length(data.aws_iam_policy_document.infra_admin_pd.json)}"
        )
    }"
}
