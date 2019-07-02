# AWS IAM Terraform module

This Terraform module provides a unique and flexible way to create an IAM Role and attach one or many IAM policies to that role. Also associated with this module we provide a clever pattern to embed variables into formatted IAM policy data resources that can be used attach to IAM roles, but they can be used by other IAM resources such as IAM groups or users.

Resources supported:
* [IAM Role](https://www.terraform.io/docs/providers/aws/r/iam_role.html)
* [IAM Policy](https://www.terraform.io/docs/providers/aws/r/iam_policy.html)


### Todo
Create support for other IAM Resources based on priority such as:
* IAM Users
* Groups
