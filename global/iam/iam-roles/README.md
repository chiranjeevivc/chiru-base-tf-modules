# AWS IAM-Roles Terraform module

This Terraform module provides a unique and flexible way to create an IAM Role and attach one or many IAM policies to that role. Also associated with this module we provide a clever pattern to embed variables into formatted IAM policy data resources that can be used attach to IAM roles, but they can be used by other IAM resources such as IAM groups or users.

Resources supported:
* [IAM Role](https://www.terraform.io/docs/providers/aws/r/iam_role.html)
* [IAM Policy](https://www.terraform.io/docs/providers/aws/r/iam_policy.html)


## Module Use Example

The following is an example of how to use the iam-role module to create a role and associate one or more IAM policies to the created role

```
## IAM ROLE
module "jenkins_role" {

  source = "git::https://tw430d@codecloud.web.att.com/scm/st_addco/addco-terraform-modules.git//global/iam/iam-roles/?ref=iam-tf-module"

  AccountMoniker         = "Jenkins"
  aws_region             = "us-east-1"
  aws_account_id         = "1234567890"
  iam_role               = "my-jenkins-role"
  trusted_policy_type    = "service-trust-policy"
  power_user_policies    = ["ec2","s3"]
  trust_policy_services  = ["ec2.amazonaws.com"]
  aws_managed_policies   = ["arn:aws:iam::aws:policy/AmazonAthenaFullAccess"]

}
```
## Parameter/Variable Walkthrough

* AccountMoniker -- This value is mainly used in the power user policies to support generating IAM policies that can control access to namespace resources within AWS. Please keep in mind not all AWS actions can be controlled through namespace restrictions, but for those that can they are controlled by this method.

* aws_region -- Where applicable this will signify the chosen AWS region

* aws_account_id -- Allows us to control access based on account number

* iam_role -- Used to set the IAM Role name but also for potentially naming other resources

* power_user_policies -- List of custom power user policies that will be attached to the created role; list of supported policies are found in the iam-polices/power-user directory in iam Terraform modules

* emr_managed_policies -- List of custom emr managed policies that will be attached to the created role; list of supported policies are found in the iam-polices/emr directory in iam Terraform modules

* aws_managed_policies -- List of aws managed policies that will be attached to the created role; list of supported policies are found in the AWS console under IAM and Policies

* trusted_policy_type -- List of service trust policies that will be attached to the created role's trust policy; things that are supported are AWS Services, Cross-Account Principals, and Federated (Web Identities and SAML 2.0)

* trust_policy_services -- List of trust policy services that will be attached to the created role's trust policy; list of supported policies is dependent on the trust policy type and is varied


## Outputs

Outputs include the following:
* iam role arn
* iam role name
