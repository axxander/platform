## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | The source CIDR blocks to allow | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The security group rule description | `string` | n/a | yes |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | The security group rule from port | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | The security group rule protocol | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | The source secutiry group IDs to allow | `list(string)` | `null` | no |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | The security group rule to port | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The security group rule type | `string` | n/a | yes |

## Outputs

No outputs.
