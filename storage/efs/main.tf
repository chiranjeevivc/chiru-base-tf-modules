resource "aws_efs_file_system" "this" {

  performance_mode = "${var.performance_mode}"
  encrypted        = "${var.encrypted}"
  kms_key_id       = "${var.kms_key_id}"
  tags             = "${merge(var.tags, map("Name", format("%s", var.name)))}"

}

resource "aws_efs_mount_target" "this" {

  count           = "${length(compact(var.subnets))}"
  file_system_id  = "${aws_efs_file_system.this.id}"
  subnet_id       = "${element(compact(var.subnets), count.index)}"
  security_groups = ["${var.security_groups}"]
}