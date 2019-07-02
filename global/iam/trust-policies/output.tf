//output.tf

output "json_out_map" {
  value = "${
        map(
            "service-trust-policy", "${data.aws_iam_policy_document.service_trust_policy_pd.json}",
            "principal-trust-policy", "${data.aws_iam_policy_document.principal_trust_policy_pd.json}",
            "principal-service-trust-policy", "${data.aws_iam_policy_document.principal_service_trust_policy_pd.json}"

        )
    }"
}

output "json_size_map" {
  value = "${
        map(
            "service-trust-policy", "${length(data.aws_iam_policy_document.service_trust_policy_pd.json)}",
            "principal-trust-policy", "${length(data.aws_iam_policy_document.principal_trust_policy_pd.json)}",
            "principal-service-trust-policy", "${length(data.aws_iam_policy_document.principal_service_trust_policy_pd.json)}"

        )
    }"
}
