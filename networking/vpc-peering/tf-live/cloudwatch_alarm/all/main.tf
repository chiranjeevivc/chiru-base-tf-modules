module "cloud_watch_alarm" {
  //change source to github repo
  source = "../../../tf-modules/cloudwatch_alarm"
  alarm_name                = "${var.alarm_name}"
  comparison_operator       = "${var.comparison_operator}"
  evaluation_periods        = "${var.evaluation_periods}"
  metric_name               = "${var.metric_name}"
  namespace                 = "${var.namespace}"
  period                    = "${var.period}"
  statistic                 = "${var.statistic}"
  threshold                 = "${var.threshold}"
  alarm_description         = "${var.alarm_description}"
  datapoints_to_alarm       = "${var.datapoints_to_alarm}"
  #insufficient_data_actions = "${var.insufficient_data_actions}"
  alarm_actions             = "${var.alarm_actions}"
  map_dimensions            = "${var.map_dimensions}"
  #ok_actions               = "${var.ok_actions}"
  #nit                      = "${var.unit}"
  actions_enabled           = "${var.actions_enabled}"
}