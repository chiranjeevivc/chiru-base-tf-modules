# -------------------------------------------------------------------------------------------------
# Hosted Zone definitions
# -------------------------------------------------------------------------------------------------
variable "public_hosted_zones" {
  description = "List of domains or subdomains for which to create public hosted zones."
  type        = "list"
  default     = []
}

variable "private_zone" {
  default = 0
}

variable "delegation_set_name" {
  description = "Create a shared delegation set among specefied hosted zones domains if not empty. (nmutually exclusive to 'delegation_set_id')."
  default     = ""
}

variable "delegation_set_id" {
  description = "Assign specified hosted zones to a delegation set specified by ID if not empty. (mutually exclusive to 'delegation_set_reference_name')."
  default     = ""
}

variable "custom_subdomain_ns" {
  description = "Hosted zones for subdomains require nameserver to be specified explicitly. You can use this variable to add a list of custom nameserver IP addresses. If left empty it will be populated by four AWS default nameserver."
  type        = "list"
  default     = []
}

variable "default_subdomain_ns_ttl" {
  description = "Hosted zones for subdomains require nameserver to be specified explicitly. This sets their default TTL."
  default     = "30"
}

# -------------------------------------------------------------------------------------------------
# Resource Tagging/Naming
# -------------------------------------------------------------------------------------------------
variable "tags" {
  description = "The resource tags that should be added to all hosted zone resources."
  type        = "map"
  default     = {}
}

variable "comment" {
  description = "The hosted zone comment that should be added to all hosted zone resources."
  default     = "Managed by Terraform"
}


#############################################################################
# Private Zone VPC
#############################################################################

variable "name" {
  type        = "string"
  description = "Name of the hosted zone"
}

variable "product_domain" {
  type        = "string"
  description = "Abbreviation of the product domain this Route 53 zone belongs to"
}

variable "environment" {
  type        = "string"
  description = "Environment this Route 53 zone belongs to"
}

variable "main_vpc" {
  type        = "string"
  description = "Main VPC ID that will be associated with this hosted zone"
}

variable "secondary_vpcs" {
  type        = "list"
  default     = []
  description = "List of VPCs that will also be associated with this zone"
}

variable "force_destroy" {
  type        = "string"
  default     = false
  description = "Whether to destroy all records inside if the hosted zone is deleted"
}