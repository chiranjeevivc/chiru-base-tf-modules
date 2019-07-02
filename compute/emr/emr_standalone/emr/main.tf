#Creates emr cluster
#need to change subnet to list, add count
resource "aws_emr_cluster" "this" {
  count                  = "${var.cluster_count}"
  name                   = "${var.name}_${count.index}"
  release_label          = "${var.release_label}"
  applications           = "${var.applications}"
  custom_ami_id          = "${var.custom_ami_id}"
  autoscaling_role       = "${var.autoscaling_role}"
  service_role           = "${var.service_role}"
  instance_group         = "${var.instance_group}"
  log_uri                = "${var.log_uri}"
  ebs_root_volume_size   = "${var.ebs_root_volume_size}"

  configurations         = "${var.configurations}"
  security_configuration = "${var.security_configuration}"
  #if instance group is not set then master instance type, core instance type and core instance count (default=1) should be set
  #master_instance_type   = "${var.master_instance_type}"
  #core_instance_type     = "${var.core_instance_type}"
  #core_instance_count    = "${var.core_instance_count}"

  #uncomment if neccessary
  #scale_down_behavior    = "${var.scale_down_behavior}"
  #additional_info        = "${var.additional_info}"
  termination_protection = "${var.termination_protection}"
  keep_job_flow_alive_when_no_steps = "${var.keep_job_flow_alive_when_no_steps}"
  visible_to_all_users = "${var.visible_to_all_users}"
  tags = "${merge(var.tags,map("Name","${var.name}"))}"
 ec2_attributes {
    key_name                          = "${var.key_name}"
    subnet_id                         = "${var.subnet_id}"
    emr_managed_master_security_group = "${var.emr_managed_master_security_group}"
    emr_managed_slave_security_group  = "${var.emr_managed_slave_security_group}"
    service_access_security_group     = "${var.emr_managed_service_access}"
    instance_profile                  = "${var.instance_profile}"
    #comment out if you want to pass in additional security groups
    additional_master_security_groups = "${var.additional_master_security_groups}"
    additional_slave_security_groups  = "${var.additional_slave_security_groups}"
  }

  step {
    action_on_failure = "${var.step_action}"
    name   = "${var.step_name}"

    hadoop_jar_step {
      jar  = "${var.hadoop_jar_file}"
      args = "${var.hadoop_jar_step_args}"

    }
  }
}

resource "aws_emr_cluster" "cluster_step_job" {
  count                  = "${var.cluster_count_with_additional_step}"
  name                   = "${var.name}_${count.index}"
  release_label          = "${var.release_label}"
  applications           = "${var.applications}"
  custom_ami_id          = "${var.custom_ami_id}"
  autoscaling_role       = "${var.autoscaling_role}"
  service_role           = "${var.service_role}"
  instance_group         = "${var.instance_group}"
  log_uri                = "${var.log_uri}"
  ebs_root_volume_size   = "${var.ebs_root_volume_size}"

  configurations         = "${var.configurations}"
  security_configuration = "${var.security_configuration}"
  #if instance group is not set then master instance type, core instance type and core instance count (default=1) should be set
  #master_instance_type   = "${var.master_instance_type}"
  #core_instance_type     = "${var.core_instance_type}"
  #core_instance_count    = "${var.core_instance_count}"

  #uncomment if neccessary
  #scale_down_behavior    = "${var.scale_down_behavior}"
  #additional_info        = "${var.additional_info}"
  termination_protection = "${var.termination_protection}"
  keep_job_flow_alive_when_no_steps = "${var.keep_job_flow_alive_when_no_steps}"
  visible_to_all_users = "${var.visible_to_all_users}"
  tags = "${merge(var.tags,map("Name","${var.name}"))}"
 ec2_attributes {
    key_name                          = "${var.key_name}"
    subnet_id                         = "${var.subnet_id}"
    emr_managed_master_security_group = "${var.emr_managed_master_security_group}"
    emr_managed_slave_security_group  = "${var.emr_managed_slave_security_group}"
    service_access_security_group     = "${var.emr_managed_service_access}"
    instance_profile                  = "${var.instance_profile}"
    #comment out if you want to pass in additional security groups
    additional_master_security_groups = "${var.additional_master_security_groups}"
    additional_slave_security_groups  = "${var.additional_slave_security_groups}"
  }

  step {
    action_on_failure = "${var.step_action}"
    name   = "${var.step_name}"

    hadoop_jar_step {
      jar  = "${var.hadoop_jar_file}"
      args = "${var.hadoop_jar_step_args}"

    }
  }

  step{
    action_on_failure = "${var.additional_step_action}"
    name   = "${var.additional_step_name}"

    hadoop_jar_step {
      jar  = "${var.additional_jar_file}"
      args = "${var.additional_step_args}"

    }
  }

}

/*

*/
/*
  kerberos_attributes{
    ad_domain_join_password= "${var.ad_domain_join_password}"
    ad_domain_join_user ="${var.ad_domain_join_user}"
    cross_realm_trust_principal_password ="${var.cross_realm_trust_principal_password}"
    kdc_admin_password  = "${var.kdc_admin_password}"
    realm = "${var.realm}"
  }*/
