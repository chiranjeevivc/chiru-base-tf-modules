# Creates Base Roles for an AWS AccountMoniker

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

resource "aws_iam_group" "iam_group" {
  count = "${var.create_group ? 1 : 0}"
  name  = "${var.iam_group}"
  path  = "${var.path_group}"
}

resource "aws_iam_policy" "power_user_policies" {
  name        = "${var.AccountMoniker}-${element(var.power_user_policies,count.index)}-policy"
  path        = "/"
  description = "${var.AccountMoniker} policy for ${element(var.power_user_policies,count.index)}"
  policy      = "${module.power_user_managed_policies_module.json_out_map[element(var.power_user_policies,count.index)]}"
  count       = "${length(var.power_user_policies)}"
}

resource "aws_iam_policy" "general_policies" {
  name        = "${var.AccountMoniker}-${element(var.general_policies,count.index)}-policy"
  path        = "/"
  description = "${var.AccountMoniker} policy for ${element(var.general_policies,count.index)}"
  policy      = "${module.general_policies_module.json_out_map[element(var.general_policies,count.index)]}"
  count       = "${length(var.general_policies)}"
}

resource "aws_iam_policy" "emr_managed_policies" {
  name        = "${var.AccountMoniker}-${element(var.emr_managed_policies,count.index)}-policy"
  path        = "/"
  description = "${var.AccountMoniker} policy for ${element(var.emr_managed_policies,count.index)}"
  policy      = "${module.emr_managed_policies_module.json_out_map[element(var.emr_managed_policies,count.index)]}"
  count       = "${length(var.emr_managed_policies)}"
}

resource "aws_iam_group_policy_attachment" "power_user_policy_attach" {
  count      = "${length(var.power_user_policies)}"
  group      = "${aws_iam_group.iam_group.name}"
  policy_arn = "${element(aws_iam_policy.power_user_policies.*.arn, count.index)}"
}

resource "aws_iam_group_policy_attachment" "general_policy_attach" {
  count      = "${length(var.general_policies)}"
  group      = "${aws_iam_group.iam_group.name}"
  policy_arn = "${element(aws_iam_policy.general_policies.*.arn, count.index)}"
}

resource "aws_iam_group_policy_attachment" "aws_managed_policy_attach" {
  count      = "${length(var.aws_managed_policies)}"
  group      = "${aws_iam_group.iam_group.name}"
  policy_arn = "${element(var.aws_managed_policies, count.index)}"
}

resource "aws_iam_group_policy_attachment" "emr_managed_policy_attach" {
  count      = "${length(var.emr_managed_policies)}"
  group      = "${aws_iam_group.iam_group.name}"
  policy_arn = "${element(aws_iam_policy.emr_managed_policies.*.arn, count.index)}"
}

resource "aws_iam_group_membership" "user_membership_existing_group" {
  count = "${var.existing_group ? 1 : 0}"
  name  = "${var.group_name}"
  users = ["${var.users}"]
  group = "${var.group}"
}

resource "aws_iam_group_membership" "user_membership" {
  count = "${var.create_group_membership ? 1 : 0}"
  name  = "${var.group_name}"
  users = ["${var.users}"]
  group = "${aws_iam_group.iam_group.name}"
}
