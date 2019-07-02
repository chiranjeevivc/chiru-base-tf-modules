# Creates Users for an AWS AccountMoniker
module "power_user_managed_policies_module" {
  source                  = "../iam-policies/power-user"
  module_tenant_namespace = "${var.AccountMoniker}"
  module_account_id       = "${var.aws_account_id}"
  module_target_region    = "${var.aws_region}"
}

module "emr_managed_policies_module" {
  source = "../iam-policies/emr"
}

module "general_policies_module" {
  source             = "../iam-policies/general"
  assumable_roles    = "${var.assumable_roles}"
  restricted_buckets = "${var.restricted_buckets}"
  bucket_kms_keys    = "${var.bucket_kms_keys}"
}

resource "aws_iam_user" "iam_user" {
  name = "${var.iam_user}"
  path = "${var.iam_user_path}"
}

resource "aws_iam_policy" "power_user_policies" {
  name   = "${var.AccountMoniker}-${element(var.power_user_policies,count.index)}-policy"
  user   = "${aws_iam_user.iam_user.name}"
  path   = "/"
  policy = "${module.power_user_managed_policies_module.json_out_map[element(var.power_user_policies,count.index)]}"
  count  = "${length(var.power_user_policies)}"
}

resource "aws_iam_policy" "emr_managed_policies" {
  name        = "${var.AccountMoniker}-${element(var.emr_managed_policies,count.index)}-policy"
  path        = "/"
  description = "${var.AccountMoniker} policy for ${element(var.emr_managed_policies,count.index)}"
  policy      = "${module.emr_managed_policies_module.json_out_map[element(var.emr_managed_policies,count.index)]}"
  count       = "${length(var.emr_managed_policies)}"
}

resource "aws_iam_policy" "general_policies" {
  name        = "${var.AccountMoniker}-${element(var.general_policies,count.index)}-policy"
  path        = "/"
  description = "${var.AccountMoniker} policy for ${element(var.general_policies,count.index)}"
  policy      = "${module.general_policies_module.json_out_map[element(var.general_policies,count.index)]}"
  count       = "${length(var.general_policies)}"
}

resource "aws_iam_user_policy_attachment" "power_user_policy_attach" {
  count      = "${length(var.power_user_policies)}"
  user       = "${aws_iam_user.iam_user.name}"
  policy_arn = "${element(aws_iam_policy.power_user_policies.*.arn, count.index)}"
}

resource "aws_iam_user_policy_attachment" "aws_managed_policy_attach" {
  count      = "${length(var.aws_managed_policies)}"
  user       = "${aws_iam_user.iam_user.name}"
  policy_arn = "${element(var.aws_managed_policies, count.index)}"
}

resource "aws_iam_user_policy_attachment" "emr_managed_policy_attach" {
  count      = "${length(var.emr_managed_policies)}"
  user       = "${aws_iam_user.iam_user.name}"
  policy_arn = "${element(aws_iam_policy.emr_managed_policies.*.arn, count.index)}"
}

resource "aws_iam_user_policy_attachment" "general_managed_policy_attach" {
  count      = "${length(var.general_policies)}"
  user       = "${aws_iam_user.iam_user.name}"
  policy_arn = "${element(aws_iam_policy.general_policies.*.arn, count.index)}"
}

# Creates  IAM access key for the user
resource "aws_iam_access_key" "iam_user_access_key" {
  count = "${var.user_create_access_key ? 1 : 0}"
  user  = "${aws_iam_user.iam_user.name}"

  #pgp_key - (Optional) Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists.
}
