# AWS managed AD Terraform module
This Terraform Module was created on 6/2/2018 and it can be found here -->
Repo --> https://bitbucket.org/deloittecloud/dcp-base-tf-modules.git//active-directory.

Terraform module which creates Managed AD on AWS.

## Usage

```
module "active-directory" {
  source = "git::https://[bitbucket-id]@bitbucket.org/deloittecloud/dcp-base-tf-modules.git//active-directory"

  name     = "Active directory name"
  AdminPassword = "Admin Password"
  edition  = "edition"
  type     = "type"

  vpc_id     = "vpc_id"
  subnet_ids = ["subnet_id1","subnet_id1"]
  tags = {
      Terraform = "true"
      Environment = "dev"
    }
}
```

| Variables           | Default Value   | Description  |
| :-------------      |:-------------   | :-----|
| name                |                 | Name of actve directory (e.g. abc.local) |
| Admin Password      |                 |  Password for active directory admin account  |
| edition             |   Standard      |   edition for the directory Standard/Enterprise  |
| type                |   MicrosoftAD   |   Type of managed directory service MicrosoftAD/SimpleAD  |
| vpc_id              |                 | VPC ID for creation of active directory   |
| subnet_ids          |                 | Subnet Ids must in different AZs   |
| tags                |                 |  Tags for the Active Directory   |
