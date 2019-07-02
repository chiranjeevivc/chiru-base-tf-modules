# AWS s3 Terraform module

Terraform module which creates S3 buckets and policies on AWS.

These types of resources are supported:

* [S3 Bucket](https://www.terraform.io/docs/providers/aws/r/s3_bucket.html)
* [S3 Bucket Policy ](https://www.terraform.io/docs/providers/aws/r/s3_bucket_policy.html)
* [AWS KMS Key ](https://www.terraform.io/docs/providers/aws/r/kms_key.html)


## Usage

```hcl
module "s3" {

  source = "git::https:///attuid@codecloud.web.att.com/scm/st_addco/addco-terraform-modules.git//storage/s3/s3-bucket/?ref=feature/s3-tf-module"
    bucket                 = "${var.bucket}"
    acl                    = "${var.acl}"
    tags                   = "${var.tags}"
    force_destroy          = "${var.force_destroy}"
    versioning             = "${var.versioning}"
    lifecycle_rule         = "${var.lifecycle_rule}"
    logging                = "${var.logging}"
    sse_algorithm          = "${var.sse_algorithm}"
    name                   = "${var.name}"
    ##s3 bucket policy variables
    create_policy          =   "${var.create_policy}"
    create_policy_with_vpc_endpoints  =   "${var.create_policy_with_vpc_endpoints}"
    source_ip              =   "${var.source_ip}"
    vpc_endpoints_deny     =   "${var.vpc_endpoints_deny}"
    vpc_endpoints_allow    =   "${var.vpc_endpoints_allow}"
    account_arn            =   "${var.account_arn}"

    #kms key variables
    deletion_window_in_days= "${var.deletion_window_in_days}"
    enable_key_rotation    = "${var.enable_key_rotation}"

}
```

## Examples

* [Basic S3 bucket]
(https://codecloud.web.att.com/projects/ST_ADDCO/repos/addco-terraform-live-macdev/browse?at=refs%2Fheads%2Ffeature%2Fsimple-s3-bucket)


## Variables for s3 bucket
- `bucket` - (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.
- `acl` - (Optional) The canned ACL to apply. Defaults to "private".
- `force_destroy` - (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable.
- `tags` - (Optional) A mapping of tags to assign to the bucket.
- `versioning` - (Optional) A state of versioning (documented below)
- `logging` - (Optional) A settings of bucket logging (documented below).
- `lifecycle_rule` - (Optional) A configuration of object lifecycle management (documented below).
- `server_side_encryption_configuration` - (Optional) A configuration of server-side encryption configuration (documented below)
- `sse_algorithm` - either aws:kms or AES256, default is aws:kms

## Variables for kms key

- `deletion_window_in_days` - (Optional) Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days.
- `enable_key_rotation` - (Optional) Specifies whether key rotation is enabled. Defaults to false.
- `tags` - (Optional) A mapping of tags to assign to the object.
- `name` - name of the kms key.

## Variables for s3 bucket policy
- `create_policy` - to create a s3 bucket policy without vpc endpoints. Defaults to true
- `create_policy_with_vpc_endpoints` - to create a s3 bucket policy with vpc endpoints. Defaults to false
- `source_ip` - approved IP addresses that are permitted access to this S3 bucket.
- `vpc_endpoints` - the list of VPC endpoints is inclusive of VPC endpoints within the owning S3 bucket account and cross-account AWS accounts
- `account_arn` - to create a s3 bucket policy without vpc endpoints. Defaults to true
- `vpc_endpoints_cross` - approved VPC endpoints that are permitted access to this S3 bucket. IMPORTANT: the list of VPC endpoints is inclusive in the previous policy statement. You must add the VPC endpoints entered here into the DenyNonApprovedIPAddressesVPCEndpoints policy as well



##How it works

S3 bucket module calls the s3 bucket policy module. After the s3 bucket is created it passes the value to the bucket policy.
The s3 bucket module also creates a kms key and uses that for encryption


Please refer to the s3 example to see how they should be used.
(https://codecloud.web.att.com/projects/ST_ADDCO/repos/addco-terraform-live-macdev/browse?at=refs%2Fheads%2Ffeature%2Fsimple-s3-bucket)
