# AWS EC2-VPC Security Group Terraform module

Terraform module which creates [EC2 security group within VPC](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html) on AWS.

These types of resources are supported:

* [EC2-VPC Security Group](https://www.terraform.io/docs/providers/aws/r/security_group.html)
* [EC2-VPC Security Group Rule](https://www.terraform.io/docs/providers/aws/r/security_group_rule.html)

## Features

This module aims to implement **ALL** combinations of arguments supported by AWS and latest stable version of Terraform:
* IPv4/IPv6 CIDR blocks
* [VPC endpoint prefix lists](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints.html) (use data source [aws_prefix_list](https://www.terraform.io/docs/providers/aws/d/prefix_list.html))
* Access from source security groups
* Access from self
* Named rules ([see the rules here](https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/rules.tf))
* Named groups of rules with ingress (inbound) and egress (outbound) ports open for common scenarios (eg, [ssh](https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/modules/ssh), [http-80](https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/modules/http-80), [mysql](https://github.com/terraform-aws-modules/terraform-aws-security-group/tree/master/modules/mysql), see the whole list [here](https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/modules/README.md))
* Conditionally create security group and all required security group rules ("single boolean switch").


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create security group and all rules | string | `true` | no |
| description | Description of security group | string | `Security Group managed by Terraform` | no |
| egress_prefix_list_ids | List of prefix list IDs (for allowing access to VPC endpoints) to use on all egress rules | string | `<list>` | no |
| rules_egress | List of egress rules to create by name | string | `<list>` | no |
| egress_with_self | List of egress rules to create where 'self' is defined | string | `<list>` | no |
| egress_with_source_security_group_id | List of egress rules to create where 'source_security_group_id' is used | string | `<list>` | no |
| ingress_prefix_list_ids | List of prefix list IDs (for allowing access to VPC endpoints) to use on all ingress rules | string | `<list>` | no |
| rules_ingress | List of ingress rules to create by name | string | `<list>` | no |
| ingress_with_self | List of ingress rules to create where 'self' is defined | string | `<list>` | no |
| ingress_with_source_security_group_id | List of ingress rules to create where 'source_security_group_id' is used | string | `<list>` | no |
| name | Name of security group | string | - | yes |
| tags | A mapping of tags to assign to security group | string | `<map>` | no |
| vpc_id | ID of the VPC where to create security group | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| this_security_group_description | The description of the security group |
| this_security_group_id | The ID of the security group |
| this_security_group_name | The name of the security group |
| this_security_group_owner_id | The owner ID |
| this_security_group_vpc_id | The VPC ID |

## Usage

**To create Ingress Rules for the Security group rules with "cidr_blocks":**

Use the variable **"rules_ingress"** and define the ingress rules as follows:

* ingress_rules_0 = ["from_port", "to_port", "protocol", "ingress_rule_0_description", "cidr_block"]

**To create Ingress Rules for the Security group rules with "source_security_group_id", but without "cidr_blocks" and "self":**

Use the variable **"ingress_with_source_security_group_id"** and define the ingress rules as follows:

* ingress_rules_0 = ["from_port", "to_port", "protocol"]

**To create Ingress Rules for the Security group rules with "self", but without "cidr_blocks" and "source_security_group_id":**

Use the variable **"ingress_with_self"** and define the ingress rules as follows:

* ingress_rules_0 = ["from_port", "to_port", "protocol", "ingress_rule_0_description"]

**To create Egress Rules for the Security group rules with "cidr_blocks":**

Use the variable **"rules_egress"** and define the egress rules as follows:

* egress_rules_0  = ["from_port", "to_port", "protocol", "egress_rule_0_description"]

**To create Egress Rules for the Security group rules with "source_security_group_id", but without "cidr_blocks" and "self":**

Use the variable **"egress_with_source_security_group_id"** and define the egress rules as follows:

* egress_rules_0 = ["from_port", "to_port", "protocol", "egress_rule_0_description"]

**To create Egress Rules for theSecurity group rules with "self", but without "cidr_blocks" and "source_security_group_id":**

Use the variable **"egress_with_self"** and define the egress rules as follows:

* egress_rules_0 = ["from_port", "to_port", "protocol", "egress_rule_0_description"]
