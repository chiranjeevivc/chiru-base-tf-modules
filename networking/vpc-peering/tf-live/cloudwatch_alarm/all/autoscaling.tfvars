
 #required
 alarm_name                = "terraform-alarm-asg-rs256x"
 comparison_operator       = "LessThanThreshold"
 evaluation_periods        = "1"
 metric_name               = "GroupMinSize"
 namespace                 = "AWS/AutoScaling"
 period                    = "300"
 threshold                 = "3"

 #optional
 statistic                 = "Average"
 alarm_description         = "Test Cloud Watch Alarm for Autoscale"
 #put sns topic arn
 alarm_actions             = ["arn:aws:sns:us-east-1:081417463982:test-ritika-alarm"]
 actions_enabled           = "true"
 datapoints_to_alarm       = "1"
 map_dimensions = {
   AutoScalingGroupName = "test-ritika"
 }


 #other variables
 #ok_actions                = "${var.ok_actions}"
 #unit                      = "${var.unit}"
 #insufficient_data_actions = "${var.insufficient_data_actions}"
