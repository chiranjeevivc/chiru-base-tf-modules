# terraform-aws-endpoint-service-for-service-provider

A Terraform module which creates VPC Endpoint Service for your application which will be the service provider


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acceptance_required | Whether or not VPC endpoint connection requests to the service must be accepted by the service owner| string | `false` | yes |
| network_load_balancer_arns | The ARNs of one or more Network Load Balancers for the endpoint service | string | ` ` | yes |
| vpc_endpoint_service_id | The ID of the VPC endpoint service to allow permission | string | ` ` | yes |
| vpc_id | The ID of the VPC in which the endpoint will be used | string | ` ` | yes |
| vpc_endpoint_type | The VPC endpoint type, Gateway or Interface | string | `Gateway` | no |
| subnet_ids | The ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type Interface. | string | ` ` | no |
| security_group_ids | The ID of one or more security groups to associate with the network interface. Required for endpoints of type Interface | list | ` ` | no |
| service_name | The service name, in the form com.amazonaws.region.service for AWS services | string | ` ` | yes |
| private_dns_enabled | Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface. Defaults to false | string | `false` | no |


## Outputs

| Name | Description |
|------|-------------|
| service_provider_name | The name of VPC Endpoint Service |
