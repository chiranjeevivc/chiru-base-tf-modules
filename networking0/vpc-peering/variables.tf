####################################################################################################
# Forked from https://github.com/grem11n/terraform-aws-vpc-peering/tree/0.0.2 06/02/2018
####################################################################################################

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "owner_account_id" {
  description = "AWS owner account ID"
  default     = ""
}

variable "vpc_peer_id" {
  description = "Peer VPC ID"
  default     = ""
}

variable "this_vpc_id" {
  description = "This VPC ID"
  default     = ""
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  default     = []
}

variable "private_route_table_ids" {
  type        = "list"
  description = "A list of private route tables"
  default     = []
}

variable "public_route_table_ids" {
  type        = "list"
  description = "A list of public route tables"
  default     = []
}

variable "peer_cidr_block" {
  description = "Peer VPC CIDR block"
  default     = ""
}

variable "auto_accept_peering" {
  description = "Auto accept peering connection"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}
