provider "aws" {
  region = "us-east-1"
}

resource "aws_directory_service_directory" "this" {

  name     = "${var.name}"
  password = "${var.AdminPassword}"
  edition  = "${var.edition}"
  type     = "${var.type}"

  vpc_settings {
    vpc_id     = "${var.vpc_id}"
    subnet_ids = ["${var.subnet_ids}"]
  }

  tags = "${var.tags}"
}
