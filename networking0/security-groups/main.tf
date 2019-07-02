#################
# Security group
#################
resource "aws_security_group" "this" {
  count = "${var.create ? 1 : 0}"
  name        = "${var.name}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"
  tags = "${merge(var.tags, map("Name", format("%s", var.name)))}"
  revoke_rules_on_delete="${var.revoke_rules_on_delete}"
}


###################################
# Ingress - List of rules (simple)
###################################
# Security group rules with "cidr_blocks" and it uses list of rules names
resource "aws_security_group_rule" "ingress_rules" {
  count = "${var.create ? length(var.rules_ingress) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]
  cidr_blocks      = ["${element(var.rules_ingress["ingress_rules_${count.index}"], 4)}"]
  description      = "${element(var.rules_ingress["ingress_rules_${count.index}"], 3)}"
  from_port = "${element(var.rules_ingress["ingress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.rules_ingress["ingress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.rules_ingress["ingress_rules_${count.index}"], 2)}"
}



##########################
# Ingress - Maps of rules
##########################
# Security group rules with "source_security_group_id", but without "cidr_blocks" and "self"
resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
  count = "${var.create ? length(var.ingress_with_source_security_group_id) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"
  source_security_group_id = "${var.source_security_group_id[count.index]}"
  #source_security_group_id = "${element(var.ingress_with_source_security_group_id["ingress_rules_${count.index}"], 4)}"
  prefix_list_ids          = ["${var.ingress_prefix_list_ids}"]
  description      = "${element(var.ingress_with_source_security_group_id["ingress_rules_${count.index}"], 3)}"
  from_port = "${element(var.ingress_with_source_security_group_id["ingress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.ingress_with_source_security_group_id["ingress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.ingress_with_source_security_group_id["ingress_rules_${count.index}"], 2)}"
}



# Security group rules with "self", but without "cidr_blocks" and "source_security_group_id"
resource "aws_security_group_rule" "ingress_with_self" {
  count = "${var.create ? length(var.ingress_with_self) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "ingress"
  self=true
  prefix_list_ids  = ["${var.ingress_prefix_list_ids}"]
  description      = "${element(var.ingress_with_self["ingress_rules_${count.index}"], 3)}"
  from_port = "${element(var.ingress_with_self["ingress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.ingress_with_self["ingress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.ingress_with_self["ingress_rules_${count.index}"], 2)}"
}

#################
# End of ingress
#################


##################################
# Egress - List of rules (simple)
##################################

# Security group rules with "cidr_blocks" and it uses list of rules names
resource "aws_security_group_rule" "egress_rules" {
  count = "${var.create ? length(var.rules_egress) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"
  prefix_list_ids  = ["${var.egress_prefix_list_ids}"]
  cidr_blocks      = ["${element(var.rules_egress["egress_rules_${count.index}"], 4)}"]
  description      = "${element(var.rules_egress["egress_rules_${count.index}"], 3)}"
  from_port = "${element(var.rules_egress["egress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.rules_egress["egress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.rules_egress["egress_rules_${count.index}"], 2)}"
}



#########################
# Egress - Maps of rules
#########################
# Security group rules with "source_security_group_id", but without "cidr_blocks" and "self"
resource "aws_security_group_rule" "egress_with_source_security_group_id" {
  count = "${var.create ? length(var.egress_with_source_security_group_id) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"
  source_security_group_id = "${var.source_security_group_id[count.index]}"
  #source_security_group_id = "${element(var.egress_with_source_security_group_id["egress_rules_${count.index}"], 4)}"
  prefix_list_ids          = ["${var.egress_prefix_list_ids}"]
  description      = "${element(var.egress_with_source_security_group_id["egress_rules_${count.index}"], 3)}"
  from_port = "${element(var.egress_with_source_security_group_id["egress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.egress_with_source_security_group_id["egress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.egress_with_source_security_group_id["egress_rules_${count.index}"], 2)}"
}


# Security group rules with "self", but without "cidr_blocks" and "source_security_group_id"
resource "aws_security_group_rule" "egress_with_self" {
  count = "${var.create ? length(var.egress_with_self) : 0}"
  security_group_id = "${aws_security_group.this.id}"
  type              = "egress"
  self=true
  prefix_list_ids  = ["${var.egress_prefix_list_ids}"]
  description      = "${element(var.egress_with_self["egress_rules_${count.index}"], 3)}"
  from_port = "${element(var.egress_with_self["egress_rules_${count.index}"], 0)}"
  to_port   = "${element(var.egress_with_self["egress_rules_${count.index}"], 1)}"
  protocol  = "${element(var.egress_with_self["egress_rules_${count.index}"], 2)}"
}


################
# End of egress
################
