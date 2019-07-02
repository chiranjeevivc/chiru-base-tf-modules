# AWS EMR - Security Configuration Terraform module

Terraform module which creates Security Configuration for the EMR clusters on AWS.

These types of resources are supported:

* [Security Configuration - EMR cluster](https://www.terraform.io/docs/providers/aws/r/emr_security_configuration.html)

## Usage

```hcl

resource "aws_emr_security_configuration" "emr_sc_encryption" {
  name = "${var.name}"
  configuration = <<EOF
{
  "EncryptionConfiguration": {
    "AtRestEncryptionConfiguration": {
      "S3EncryptionConfiguration": {
        "EncryptionMode": "SSE-S3"
      },
      "LocalDiskEncryptionConfiguration": {
        "EncryptionKeyProviderType": "AwsKms",
        "AwsKmsKey": "${aws_kms_key.emr_kms_key.arn}"
      }
    },
    "EnableInTransitEncryption": false,
    "EnableAtRestEncryption": false
  }
}
EOF
}

```

## Examples

* [Basic EMR cluster]
(https://codecloud.web.att.com/projects/ST_ADDCO/repos/addco-terraform-live-macdev/browse?at=refs%2Fheads%2Fsimple-emr)


## Variables
These variables are for the kms policy. All have default values, please change accordingly

- `name` - Name of for key
- `tags`- tags to be provided
- `iam_key_users_permissions_identifiers`
- `iam_key_users_permissions_actions`
- `iam_key_users_permissions_resources`
- `iam_users_key_administrators_access_identifiers`
- `iam_users_key_administrators_access_actions`
- `iam_users_key_administrators_access_resources`
- `iam_key_users`
- `iam_key_users_actions`
- `iam_key_users_resources`
- `grant_resource_for_key`
- `grant_resource_for_key_actions`
- `grant_resource_for_key_resources`



## Outputs

- `emr_security_configuration` - name of security configuration
- `emr_kms_key_id` - kms key id
