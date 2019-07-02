variable "vpc_id" {
  description = "ID of VPC for the directory"
  default = ""
}

variable "subnet_ids" {
  description = "ID of subnets for the domain controllers. The two subnets must be in different Availability Zones"
  type = "list"
  default = []
}

variable "name" {
  description = "The fully qualified name for the directory, such as corp.example.com"
  default = ""
}

variable "AdminPassword" {
  description = "The password for the directory administrator or connector user"
  default = ""
}

variable "edition" {
  description = "The MicrosoftAD edition (Standard or Enterprise). Defaults to Enterprise (applies to MicrosoftAD type only)"
  default = "Standard"
}

variable "type" {
  description = "The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD"
  default = "MicrosoftAD"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}