####################################################################################################
# Forked from https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/1.9.0 07/02/2018
####################################################################################################

terraform {
  required_version = ">= 0.10.3" # ?? for ec2?
}

locals {
  is_t2_instance_type = "${replace(replace(var.instance_type, "/^[^t2].*/", "0"), "/^t2.*$/", "1")}"
}


resource "aws_instance" "this" {
  count = "${var.instance_count * (1 - local.is_t2_instance_type)}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"
  private_ip             = "${var.private_ip}"
  ipv6_address_count     = "${var.ipv6_address_count}"
  ipv6_addresses         = "${var.ipv6_addresses}"
  ebs_optimized          = "${var.ebs_optimized}"
  volume_tags            = "${var.volume_tags}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"
  ephemeral_block_device = "${var.ephemeral_block_device}"
  source_dest_check      = "${var.source_dest_check}"


  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  tags = "${merge(var.tags, map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index+1) : var.name))}"

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = ["private_ip", "root_block_device"]
  }
}

resource "aws_instance" "this_t2" {
  count = "${var.instance_count * local.is_t2_instance_type}"

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  user_data              = "${var.user_data}"
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  monitoring             = "${var.monitoring}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  iam_instance_profile   = "${var.iam_instance_profile}"
  private_ip             = "${var.private_ip}"
  ipv6_address_count     = "${var.ipv6_address_count}"
  ipv6_addresses         = "${var.ipv6_addresses}"
  ebs_optimized          = "${var.ebs_optimized}"
  volume_tags            = "${var.volume_tags}"
  root_block_device      = "${var.root_block_device}"
  ebs_block_device       = "${var.ebs_block_device}"
  ephemeral_block_device = "${var.ephemeral_block_device}"

  source_dest_check                    = "${var.source_dest_check}"
  disable_api_termination              = "${var.disable_api_termination}"
  instance_initiated_shutdown_behavior = "${var.instance_initiated_shutdown_behavior}"
  placement_group                      = "${var.placement_group}"
  tenancy                              = "${var.tenancy}"

  credit_specification {
    cpu_credits = "${var.cpu_credits}"
  }

  tags = "${merge(var.tags, map("Name", var.instance_count > 1 ? format("%s-%d", var.name, count.index+1) : var.name))}"

  lifecycle {
    # Due to several known issues in Terraform AWS provider related to arguments of aws_instance:
    # (eg, https://github.com/terraform-providers/terraform-provider-aws/issues/2036)
    # we have to ignore changes in the following arguments
    ignore_changes = ["private_ip", "root_block_device"]
  }
}
