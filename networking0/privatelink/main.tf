resource "aws_vpc_endpoint_service" "this" {
  count= "${var.create_endpoint-service ? 1 : 0}"
  acceptance_required        = "${var.acceptance_required}"
  network_load_balancer_arns = ["${var.nlb_arns}"]
}

resource "aws_vpc_endpoint_service_allowed_principal" "this" {
  vpc_endpoint_service_id = "${aws_vpc_endpoint_service.this.id}"
  count                   = "${length(var.allowed_principals)}"
  principal_arn           = "${element(var.allowed_principals, count.index)}"
}

resource "aws_vpc_endpoint" "this" {
  vpc_id                = "${var.vpc_id}"
  vpc_endpoint_type     = "${var.vpc_endpoint_type}"
  subnet_ids            = ["${var.subnet_ids}"]
  security_group_ids    = ["${var.security_group_ids}"]
  service_name          = "${aws_vpc_endpoint_service.this.service_name}"
  private_dns_enabled   = "${var.private_dns_enabled}"
}
