
 #required
 alarm_name                = "terraform-alarm-loadbalancer-rs256x"
 comparison_operator       = "LessThanThreshold"
 evaluation_periods        = "1"
 metric_name               = "HealthyHostCount"
 namespace                 = "AWS/EC2"
 period                    = "300"
 threshold                 = "1"

 #optional
 statistic                 = "Average"
 alarm_description         = "Test Cloud Watch Alarm for load_balancer"
 #put sns topic arn
 alarm_actions             = ["arn:aws:sns:us-east-1:081417463982:test-ritika-alarm"]
 actions_enabled           = "true"
 datapoints_to_alarm       = "1"
 # Dimension for autoscale: AutoScalingGroupName
 map_dimensions = {
   #last part of target group needs to be an arn
   TargetGroup = "targetgroup/RDPgatewayLoadBalancedTargets/2fc5daaa831b1866"
   LoadBalancer = "net/RDGW-Entry-SingleAZ/94d2effc0300c549"
 }



 #ok_actions                = "${var.ok_actions}"
 #unit                      = "${var.unit}"
 #insufficient_data_actions = "${var.insufficient_data_actions}"
