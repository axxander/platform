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
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_private_subnet_lookup"></a> [enable\_private\_subnet\_lookup](#input\_enable\_private\_subnet\_lookup) | Whether to enable private subnet lookup | `bool` | `true` | no |
| <a name="input_enable_public_subnet_lookup"></a> [enable\_public\_subnet\_lookup](#input\_enable\_public\_subnet\_lookup) | Whether to enable public subnet lookup | `string` | n/a | yes |
| <a name="input_subnet_privacy_tag"></a> [subnet\_privacy\_tag](#input\_subnet\_privacy\_tag) | Name of tag used to differentiate public and private resources | `string` | `"???"` | no |
| <a name="input_subnet_privacy_tag_value"></a> [subnet\_privacy\_tag\_value](#input\_subnet\_privacy\_tag\_value) | Value of subnet privacy tag | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ids"></a> [private\_ids](#output\_private\_ids) | List of all private subnet ids found |
| <a name="output_public_ids"></a> [public\_ids](#output\_public\_ids) | List of all public subnet cidr blocks found |
