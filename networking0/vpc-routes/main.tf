######################
# Route Table Routes
######################
resource "aws_route" "route_table_gw_id" {
  count = "${length(var.gw_routes)}"

  route_table_id         = "${element(var.gw_routes["routes_${count.index}"], 0)}"
  destination_cidr_block = "${element(var.gw_routes["routes_${count.index}"], 1)}"
  gateway_id             = "${element(var.gw_routes["routes_${count.index}"], 2)}"
}

resource "aws_route" "route_table_nat_gw_id" {
  count = "${length(var.nat_gw_routes)}"

  route_table_id         = "${element(var.nat_gw_routes["routes_${count.index}"], 0)}"
  destination_cidr_block = "${element(var.nat_gw_routes["routes_${count.index}"], 1)}"
  gateway_id             = "${element(var.nat_gw_routes["routes_${count.index}"], 2)}"
}

resource "aws_route" "route_table_peer_id" {
  count = "${length(var.peer_routes)}"

  route_table_id         = "${element(var.peer_routes["routes_${count.index}"], 0)}"
  destination_cidr_block = "${element(var.peer_routes["routes_${count.index}"], 1)}"
  gateway_id             = "${element(var.peer_routes["routes_${count.index}"], 2)}"
}
