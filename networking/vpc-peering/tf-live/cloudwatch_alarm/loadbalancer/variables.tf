variable "alarm_name" {}

variable "comparison_operator" {}

variable "evaluation_periods" {}

variable "metric_name" {}

variable "namespace" {}

variable "period" {}

variable "statistic" {}

variable "threshold" {}

variable "alarm_description" {}

#variable "insufficient_data_actions" {
#    type="list"
#}
variable "map_dimensions" {
  type = "map"
}

variable "alarm_actions" {
  type="list"
}

variable "datapoints_to_alarm" {}

#variable "ok_actions" {}

#variable "unit" {}

variable "actions_enabled" {}
