variable "gw_routes" {
  description = "Map of VPC Routes (define as 'name' = ['route_table_id', 'destination_cidr_block', 'gateway or peer id'])"
  type        = "map"
  default     = {}
}

variable "nat_gw_routes" {
  description = "Map of VPC Routes (define as 'name' = ['route_table_id', 'destination_cidr_block', 'gateway or peer id'])"
  type        = "map"
  default     = {}
}

variable "peer_routes" {
  description = "Map of VPC Routes (define as 'name' = ['route_table_id', 'destination_cidr_block', 'gateway or peer id'])"
  type        = "map"
  default     = {}
}
