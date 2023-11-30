## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_naming"></a> [resource\_naming](#module\_resource\_naming) | ../resource-naming | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_default_egress_rule"></a> [create\_default\_egress\_rule](#input\_create\_default\_egress\_rule) | Whether to create a default egress rule | `bool` | `true` | no |
| <a name="input_egress_rules_with_cidr"></a> [egress\_rules\_with\_cidr](#input\_egress\_rules\_with\_cidr) | The egress rules with CIDR source | <pre>set(object({<br>    description = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_egress_rules_with_sg"></a> [egress\_rules\_with\_sg](#input\_egress\_rules\_with\_sg) | The egress rules with security group source | <pre>set(object({<br>    description        = string<br>    from_port          = number<br>    to_port            = number<br>    protocol           = string<br>    security_group_ids = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional default tags | `map(string)` | `{}` | no |
| <a name="input_ingress_rules_with_cidr"></a> [ingress\_rules\_with\_cidr](#input\_ingress\_rules\_with\_cidr) | The ingress rules with CIDR source | <pre>set(object({<br>    description = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_ingress_rules_with_sg"></a> [ingress\_rules\_with\_sg](#input\_ingress\_rules\_with\_sg) | The ingress rules with security group source | <pre>set(object({<br>    description        = string<br>    from_port          = number<br>    to_port            = number<br>    protocol           = string<br>    security_group_ids = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | The name of the organisation | `string` | `"alexgregorydotio"` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The security group description | `string` | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The security group name | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | The name of the service | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Security group tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC the security group resides in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
