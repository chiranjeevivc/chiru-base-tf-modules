#######################
# Launch configuration
#######################


locals {
  tags_asg_format = ["${null_resource.tags_as_list_of_maps.*.triggers}"]
}

resource "null_resource" "tags_as_list_of_maps" {
  count = "${length(keys(var.tags_as_map))}"

  triggers = "${map(
    "key", "${element(keys(var.tags_as_map), count.index)}",
    "value", "${element(values(var.tags_as_map), count.index)}",
    "propagate_at_launch", "true"
  )}"
}

resource "random_uuid" "uuid" { }


resource "aws_launch_configuration" "this" {
  count = "${var.create_lc}"
  name                        = "${var.lc_name}_${random_uuid.uuid.result}"
  image_id                    = "${var.image_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.security_groups}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  enable_monitoring           = "${var.enable_monitoring}"
  spot_price                  = "${var.spot_price}"
  placement_tenancy           = "${var.placement_tenancy }"
  ebs_optimized               = "${var.ebs_optimized}"
  ebs_block_device            = "${var.ebs_block_device}"
  ephemeral_block_device      = "${var.ephemeral_block_device}"
  root_block_device           = "${var.root_block_device}"

  lifecycle {
    create_before_destroy = true
  }
}

####################
# Autoscaling group
####################

## You must specify either launch_configuration or launch_template
## This script only enables launch configuration

resource "aws_autoscaling_group" "this" {
  count = "${var.create_asg}"
  launch_configuration = "${var.create_lc ? element(aws_launch_configuration.this.*.name, 0) : var.launch_configuration}"
  name = "asg-${aws_launch_configuration.this.name}"
  vpc_zone_identifier  = ["${var.vpc_zone_identifier}"]
  max_size             = "${var.max_size}"
  min_size             = "${var.min_size}"
  desired_capacity     = "${var.desired_capacity}"
  load_balancers            = ["${var.load_balancers}"]
  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  min_elb_capacity          = "${var.min_elb_capacity}"
  wait_for_elb_capacity     = "${var.wait_for_elb_capacity}"
  target_group_arns         = ["${var.target_group_arns}"]
  default_cooldown          = "${var.default_cooldown}"
  force_delete              = "${var.force_delete}"
  termination_policies      = "${var.termination_policies}"
  suspended_processes       = "${var.suspended_processes}"
  placement_group           = "${var.placement_group}"
  enabled_metrics           = ["${var.enabled_metrics}"]
  metrics_granularity       = "${var.metrics_granularity}"
  wait_for_capacity_timeout = "${var.wait_for_capacity_timeout}"
  protect_from_scale_in     = "${var.protect_from_scale_in}"

  tags = ["${concat(
      list(map("key", "Name", "value", var.name, "propagate_at_launch", true)),
      var.tags,
      local.tags_asg_format
   )}"]

  lifecycle {
    create_before_destroy = true
  }
}
