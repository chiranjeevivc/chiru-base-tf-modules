# AWS EMR Terraform module

Terraform module which creates EMR clusters on AWS.

These types of resources are supported:

* [EMR cluster](https://www.terraform.io/docs/providers/aws/r/emr_cluster.html)

## Usage

```hcl
module "emr_cluster" {
  source   = "git::https://[attid]@codecloud.web.att.com/scm/st_addco/addco-terraform-modules.git//compute/emr/emr_standalone/emr/?ref=emr-tf-module"
  name                               = "emr-test-arn"
  cluster_count                      = 1
  release_label                      = "emr-4.6.0"
  applications                       = ["Spark"]

}
```

## Examples

* [Basic EMR cluster]
(https://codecloud.web.att.com/projects/ST_ADDCO/repos/addco-terraform-live-macdev/browse?at=refs%2Fheads%2Fsimple-emr)


## Variables

- `name` - Name of EMR cluster
- `cluster_count` - number of clusters to create (default=1)
- `subnet_id` - VPC subnet id where you want the job flow to launch
- `release_label` - EMR release version to use (default: `emr-5.12.1`)
- `applications` - A list of EMR release applications (default: `["Presto","Hive","Hue","Pig"]`)
- `configurations` - JSON array of EMR application configurations
- `key_name` - Amazon EC2 key pair that can be used to ssh to the master node as the user called hadoop
- `instance_groups` - List of objects for each desired instance group (see section below)
- `log_uri` - S3 URI of the EMR log destination, must begin with `s3n://` and end with trailing slashes
- `ebs_root_volume_size` - "Size in GiB of the EBS root device volume of the Linux AMI that is used for each EC2 instance - (default=2-)
- `autoscaling_role` - IAM role for automatic scaling policies
- `service_role` - IAM role that will be assumed by the Amazon EMR service to access AWS resources
- `instance_profile` - Instance Profile for EC2 instances of the cluster assume this role
- `security_configuratione` - The security configuration name to attach to the EMR cluster
- `emr_managed_master_security_group` - Identifier of the Amazon EC2 EMR-Managed security group for the master node
- `emr_managed_slave_security_group` - Identifier of the Amazon EC2 EMR-Managed security group for the slave nodes
- `emr_managed_service_access` - Identifier of the Amazon EC2 service-access security group-required when the cluster runs on a private subnet
- `tags` - list of tags to apply to the EMR Cluster
- `custom_ami_id` - A custom Amazon Linux AMI for the cluster (instead of an EMR-owned AMI). Available in Amazon EMR version 5.7.0 and later
- `termination_protection` - "Switch on/off termination protection (default = true )
- `keep_job_flow_alive_when_no_steps` - Switch on/off run cluster with no steps or when all steps are complete (default-true)
- `visible_to_all_users` - Whether the job flow is visible to all IAM users of the AWS account associated with the job flow. (default: `true`)
- `security_configuratione` - The security configuration name to attach to the EMR cluster
- `hadoop_jar_step_args` - argument for step job (default = [])
- `step_action` - The action to take if the step fails. Valid values: TERMINATE_JOB_FLOW, TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE (default=CONTINUE)
- `hadoop_jar_file` - Path to a JAR file run during the step (default ="")
- `step_name` - Name for the step (default = "")
- `debug_jar_file` - debug step job (default= command-runner.jar)
- `debug_jar_step_args` - default = ["state-pusher-script"]
- `debug_step_action` - The action to take if the step fails. Valid values: TERMINATE_JOB_FLOW, TERMINATE_CLUSTER, CANCEL_AND_WAIT, and CONTINUE (default = TERMINATE_CLUSTER)
- `debug_step_name` - Name for the step (default: `Setup Hadoop Debugging`)
- `ad_domain_join_password` - The Active Directory password for ad_domain_join_user (default = "")
- `ad_domain_join_user` - Required only when establishing a cross-realm trust with an Active Directory domain. A user with sufficient privileges to join resources to the domain. (default ="")
- `cross_realm_trust_principal_password` - TRequired only when establishing a cross-realm trust with a KDC in a different realm. The cross-realm principal password, which must be identical across realms (default ="")
- `kdc_admin_password` - The password used within the cluster for the kadmin service on the cluster-dedicated KDC, which maintains Kerberos principals, password policies, and keytabs for the cluster. (default ="")
- `realm` - The name of the Kerberos realm to which all nodes in a cluster belong. (default ="")



## Instance Group Example

```hcl
[
    {
      name           = "MasterInstanceGroup"
      instance_role  = "MASTER"
      instance_type  = "m3.xlarge"
      instance_count = 1
    },
    {
      name           = "CoreInstanceGroup"
      instance_role  = "CORE"
      instance_type  = "m3.xlarge"
      instance_count = "1"
      bid_price      = "0.30"
    },
]
```


## Outputs

- `id` - The ID of the EMR Cluster
- `name` -  The name of the cluster.
- `release_label` - The release label for the Amazon EMR release.
- `master_security_group_id` - Security group ID of the master instance/s
- `slave_security_group_id` - Security group ID of the slave instance/s


##Other Modules Referenced

EMR module calls upon other modules.

Modules necessary for the EMR cluster:

* IAM
* Security Groups
* Security Configuration

The emr cluster needs outputs from these modules to work successfully.
Values neccessary:
- `autoscaling_role` - IAM role for automatic scaling policies
- `service_role` - IAM role that will be assumed by the Amazon EMR service to access AWS resources
- `instance_profile` - Instance Profile for EC2 instances of the cluster assume this role
- `security_configuratione` - The security configuration name to attach to the EMR cluster
- `emr_managed_master_security_group` - Identifier of the Amazon EC2 EMR-Managed security group for the master node
- `emr_managed_slave_security_group` - Identifier of the Amazon EC2 EMR-Managed security group for the slave nodes
- `emr_managed_service_access` - Identifier of the Amazon EC2 service-access security group-required when the cluster runs

Please refer to the emr example to see how they should be used.
(https://codecloud.web.att.com/projects/ST_ADDCO/repos/addco-terraform-live-macdev/browse?at=refs%2Fheads%2Fsimple-emr)
