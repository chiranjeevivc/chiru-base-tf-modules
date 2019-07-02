terraform {
  backend "s3" {
    bucket  = "sb-mac-platformconfig-us-east-1"
    key     = "mac-cloudwatch-alarm-test-1/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
