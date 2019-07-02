#################
# Security group
#################
variable "create" {
  description = "Whether to create security group and all rules"
  default     = true
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
}

variable "name" {
  description = "Name of security group"
}

variable "description" {
  description = "Description of security group"
  default     = "Security Group managed by Terraform"
}

variable "tags" {
  description = "A mapping of tags to assign to security group"
  default     = {}
}


variable "revoke_rules_on_delete" {
  default = "false"
}


##########
# Ingress
##########


variable "rules_ingress" {
  description = "Map of known security group rules (define as 'name' = ['from port', 'to port', 'protocol', 'description', 'cidr_blocks'])"
  type        = "map"

  # Protocols (tcp, udp, icmp, all - are allowed keywords) or numbers (from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml):
  # All = -1, IPV4-ICMP = 1, TCP = 6, UDP = 16, IPV6-ICMP = 58
  default = {}
}

variable "ingress_with_source_security_group_id" {
  description = "Map of ingress rules to create where 'source_security_group_id' is used (define as 'name' = ['from port', 'to port', 'protocol', 'description', 'source_security_group_id'])"
  type        = "map"
  default = {}
}

variable "source_security_group_id" {
  type = "list"
  default = []
}

variable "ingress_with_self" {
  description = "Map of ingress rules to create where 'self' is defined (define as 'name' = ['from port', 'to port', 'protocol', 'description')"
  type        = "map"
  default = {}
}


variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  default     = []
}


variable "ingress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules"
  default     = []
}

#########
# Egress
#########

variable "rules_egress" {
  description = "Map of known security group rules (define as 'name' = ['from port', 'to port', 'protocol', 'description', 'cidr_blocks'])"
  type        = "map"

  # Protocols (tcp, udp, icmp, all - are allowed keywords) or numbers (from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml):
  # All = -1, IPV4-ICMP = 1, TCP = 6, UDP = 16, IPV6-ICMP = 58
  default = {}
}


variable "egress_with_self" {
  description = "Map of egress rules to create where 'self' is defined (define as 'name' = ['from port', 'to port', 'protocol', 'description')"
  type        = "map"
  default = {}
}

variable "egress_with_source_security_group_id" {
  description = "Map of egress rules to create where 'source_security_group_id' is used (define as 'name' = ['from port', 'to port', 'protocol', 'description', 'source_security_group_id'])"
  type        = "map"
  default = {}
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all egress rules"
  default     = []
}

variable "egress_prefix_list_ids" {
  description = "List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules"
  default     = []
}
