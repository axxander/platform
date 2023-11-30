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
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.cname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_manager_tags"></a> [certificate\_manager\_tags](#input\_certificate\_manager\_tags) | CloudFront distribution tags | `map(string)` | `{}` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The website domain, e.g. example.com | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional default tags | `map(string)` | `{}` | no |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | The name of the organisation | `string` | `"alexgregorydotio"` | no |
| <a name="input_private_hosted_zone"></a> [private\_hosted\_zone](#input\_private\_hosted\_zone) | Whether route 53 domain corresponding to domain is private | `bool` | `false` | no |
| <a name="input_service"></a> [service](#input\_service) | The name of the service | `string` | n/a | yes |

## Outputs

No outputs.
