
variable "name" {
  description = "Name to be used on all the resources as identifier"
}

variable "cluster_count"{
  description = "number of clusters to create with one step job"
  default = 0
}

variable "cluster_count_with_additional_step" {
  description = "number of clusters to create with 2 step jobs"
  default = 0
}

variable "subnet_id" {
  description = "VPC subnet id where you want the job flow to launch"
}

variable "release_label" {
  description = "The release label for the Amazon EMR release"
  default = "emr-5.12.1"
}


variable "applications" {
  description = " A list of applications for the cluster"
  type    = "list"
  default = ["Presto","Hive","Hue","Pig"]
  #applications = ["Spark","Hadoop","Pig","Hue","Zeppelin","Hive", "HCatalog","HBase","Presto","Tez","ZooKeeper",
  #                "Sqoop","Phoenix","Flink","Mahout","Oozie","Livy","Ganglia","MXNet"]
}

#note:Available in Amazon EMR version 4.x and later"
variable "ebs_root_volume_size" {
  description = "Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance"
  default = "20"
}

variable "autoscaling_role"{
  description = "IAM role for automatic scaling policies"
}

variable "service_role"{
  description = "IAM role that will be assumed by the Amazon EMR service to access AWS resources"
}

variable "instance_profile"{
  description = "Instance Profile for EC2 instances of the cluster assume this role"
}

variable "security_configuration"{
  description = "The security configuration name to attach to the EMR cluster"
  #default = ""
}

variable "emr_managed_master_security_group"{
  description = "Identifier of the Amazon EC2 EMR-Managed security group for the master node"
}

variable "emr_managed_slave_security_group"{
  description = "Identifier of the Amazon EC2 EMR-Managed security group for the slave nodes"
}
variable "emr_managed_service_access"{
  description = "Identifier of the Amazon EC2 service-access security group-required when the cluster runs on a private subnet"
}
variable "key_name"{
  description = "Amazon EC2 key pair that can be used to ssh to the master node as the user called hadoop"
}
variable "tags"{
  description = "list of tags to apply to the EMR Cluster"
  type = "map"
  default = {
      Project     = "emr_cluster"
      Environment = "Mac-Dev-DataEng-EMR-Cluster_2"
      Department  = "MAC"
      Requestor   = "rs256x"
  }
}


variable "custom_ami_id"{
  description = "A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later"
}

variable "log_uri"{
  description = "S3 bucket to write the log files of the job flow. If a value is not provided, logs are not created"
}
variable "configurations"{
  description = "List of configurations supplied for the EMR cluster you are creating"
  #default = ""
}


variable "instance_group"{
  description = "IAM role that will be assumed by the Amazon EMR service to access AWS resources"
  default = [
      {
        name           = "MasterInstanceGroup"
        instance_role  = "MASTER"
        instance_type  = "m5.2xlarge"
        instance_count = 1
      }
  ]
}


#uncomment and define the three variables if instance group is not defined
/*
variable "master_instance_type"{}
variable "core_instance_type"{}
variable "core_instance_count"{
  default = "1"
}



#Note: Currently there is no API to retrieve the value of this argument after EMR cluster creation from provider,
#therefore Terraform cannot detect drift from the actual EMR cluster if its value is changed outside Terraform

variable "additional_info"{
  description = "A JSON string for selecting additional features such as adding proxy information"
  default = ""
}

variable "scale_down_behavior"{
  description = "individual Amazon EC2 instances terminate when an automatic scale-in activity occurs or an instance group is resized"
  default = ""
}
*/

variable "termination_protection"{
  description = "Switch on/off termination protection"
  default = true
}


variable "keep_job_flow_alive_when_no_steps"{
  description = "Switch on/off run cluster with no steps or when all steps are complete"
  default = true
}
variable "visible_to_all_users"{
  description = "Whether the job flow is visible to all IAM users of the AWS account associated with the job flow."
  default = true
}


#comment this out if you want to add additional security groups

variable "additional_master_security_groups"{
  description = "String containing a comma separated list of additional Amazon EC2 security group IDs for the master node"
  default = ""
}
variable "additional_slave_security_groups"{
  description = "String containing a comma separated list of additional Amazon EC2 security group IDs for the slave nodes as a comma separated string"
  default = ""
}




##variables for step job
variable "hadoop_jar_step_args" {
  type = "list"
  default = ["state-pusher-script"]
}

variable "step_action" {
  description = "The action to take if the step fails. Valid values: TERMINATE_JOB_FLOW, TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE"
  default = "CONTINUE"
}

variable "hadoop_jar_file" {
  description = "Path to a JAR file run during the step."
  default = "command-runner.jar"
}

variable "step_name" {
  description = "Name for the step"
  default = "Setup Hadoop Debugging"
}

##2nd step job

variable "additional_step_args" {
  type = "list"
  default = []
}

variable "additional_step_action" {
  description = "The action to take if the step fails. Valid values: TERMINATE_JOB_FLOW, TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE"
  default = "CONTINUE"
}

variable "additional_jar_file" {
  description = "Path to a JAR file run during the step."
  default = ""
}

variable "additional_step_name" {
  description = "Name for the step"
  default = ""
}



###variables for kerberos

variable "ad_domain_join_password" {
  description = "The Active Directory password for ad_domain_join_user"
  default= ""
}
variable "ad_domain_join_user" {
  description = "Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain."
  default= ""
}
variable "cross_realm_trust_principal_password" {
  description = "Required only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms."
  default= ""
}
variable "kdc_admin_password" {
  description = "The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster."
  default= ""
}
variable "realm" {
  description = "The name of the Kerberos realm to which all nodes in a cluster belong."
  default = ""
}
