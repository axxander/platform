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
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID | `string` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional default tags | `map(string)` | `{}` | no |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | The name of the organisation | `string` | `"alexgregorydotio"` | no |
| <a name="input_service"></a> [service](#input\_service) | The name of the service | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_prefix"></a> [iam\_policy\_prefix](#output\_iam\_policy\_prefix) | n/a |
| <a name="output_iam_role_prefix"></a> [iam\_role\_prefix](#output\_iam\_role\_prefix) | n/a |
| <a name="output_parameter_store_prefix"></a> [parameter\_store\_prefix](#output\_parameter\_store\_prefix) | n/a |
| <a name="output_s3_bucket_prefix"></a> [s3\_bucket\_prefix](#output\_s3\_bucket\_prefix) | n/a |
| <a name="output_secrets_manager_prefix"></a> [secrets\_manager\_prefix](#output\_secrets\_manager\_prefix) | n/a |
| <a name="output_security_group_prefix"></a> [security\_group\_prefix](#output\_security\_group\_prefix) | n/a |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |
