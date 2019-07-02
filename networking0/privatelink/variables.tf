variable "nlb_arns" {
  type    = "list"
  description = "List of all NLB ARNs which associate with the endpoint service"
}

variable "acceptance_required" {
  default = false
  description = "Whether or not VPC endpoint connection requests to the service must be accepted by the service owner"
}

variable "allowed_principals" {
  type    = "list"
  description = "List of all whitelist AWS principals to connect to this endpoint"
}

variable "create_endpoint-service" {
  default = true
}

variable "vpc_id" {
}

variable "vpc_endpoint_type" {
  default = "Interface"
}

variable "subnet_ids" {
  type    = "list"
}

variable "security_group_ids" {
  type    = "list"
}

variable "private_dns_enabled" {
  default = true
}
