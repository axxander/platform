## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_naming"></a> [resource\_naming](#module\_resource\_naming) | ../resource-naming | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 4.0.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_private_subnet_tags"></a> [additional\_private\_subnet\_tags](#input\_additional\_private\_subnet\_tags) | The private subnets tags | `map(string)` | `{}` | no |
| <a name="input_additional_public_subnet_tags"></a> [additional\_public\_subnet\_tags](#input\_additional\_public\_subnet\_tags) | The public subnets tags | `map(string)` | `{}` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The list of AWS availability zones for the AWS region | `list(string)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional default tags | `map(string)` | `{}` | no |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | The name of the organisation | `string` | `"alexgregorydotio"` | no |
| <a name="input_private_subnet_names"></a> [private\_subnet\_names](#input\_private\_subnet\_names) | The private subnet names | `list(string)` | `[]` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | The private subnet CIDRs | `list(string)` | n/a | yes |
| <a name="input_public_subnet_names"></a> [public\_subnet\_names](#input\_public\_subnet\_names) | The public subnet names | `list(string)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | The public subnet CIDRs | `list(string)` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The name of the service | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The VPC tags | `map(string)` | `{}` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The VPC CIDR | `string` | n/a | yes |

## Outputs

No outputs.
