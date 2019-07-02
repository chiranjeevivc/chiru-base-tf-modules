//output.tf

output "json_out_map" {
  value = "${
        map(
            "viewonly", "${data.aws_iam_policy_document.viewonly_pd.json}",
            "assumerole_only", "${data.aws_iam_policy_document.assumerole_only_pd.json}",
            "s3_restricted", "${data.aws_iam_policy_document.s3_restricted_pd.json}"
        )
    }"
}

output "json_size_map" {
  value = "${
        map(
            "viewonly", "${length(data.aws_iam_policy_document.viewonly_pd.json)}",
            "assumerole_only", "${length(data.aws_iam_policy_document.assumerole_only_pd.json)}",
            "s3_restricted", "${length(data.aws_iam_policy_document.s3_restricted_pd.json)}"
        )
    }"
}
