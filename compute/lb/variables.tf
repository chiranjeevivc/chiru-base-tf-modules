variable "name" {
  description = "The name of the ELB"
}

variable "load_balancer_type" {
  description = "The type of the ELB"
}

variable "security_groups" {
  description = "A list of security group IDs to assign to the ELB"
  type        = "list"
}

variable "subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type        = "list"
}

variable "internal" {
  description = "If true, ELB will be an internal ELB"
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "access_logs" {
  description = "An access logs block"
  type        = "list"
  default     = []
}

/*
variable "listener" {
  description = "A list of listener blocks"
  type        = "list"
}

variable "health_check" {
  description = "A health check block"
  type        = "list"
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}
*/

variable "vpc_id" {
  description = "The name of the vpc_id"
}


variable "create_nlb" {
  default = true
}

variable "create_alb" {
  default = true
}


## Target group rules for Application Load Balancer

variable "rules_alb" {
  description = "Map of alb rules (define as 'name' = ['port', 'protocol', 'vpc_id', 'name'])"
  type        = "map"
  default = {}
}


## Listener Rules for Application Load balancer

variable "rules_listener_alb" {
  description = "Map of alb listener rules (define as 'name' = ['port', 'protocol', 'ssl_policy', 'certificate_arn'])"
  type        = "map"
  default = {}
}


## Target group rules for Network Load Balancer

variable "rules_nlb" {
  description = "Map of alb rules (define as 'name' = ['port', 'protocol', 'vpc_id', 'name'])"
  type        = "map"
  default = {}
}

## Listener Rules for Network Load balancer

variable "rules_listener_nlb" {
  description = "Map of nlb listener rules (define as 'name' = ['port', 'protocol', 'ssl_policy', 'certificate_arn'])"
  type        = "map"
  default = {}
}
