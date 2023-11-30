## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.us_east_1"></a> [aws.us\_east\_1](#provider\_aws.us\_east\_1) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_cache_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_route53_record.apex](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_website_configuration.domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.error](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.index](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_iam_policy_document.domain_public_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_tags"></a> [bucket\_tags](#input\_bucket\_tags) | Bucket tags | `map(string)` | `{}` | no |
| <a name="input_cloudfront_distribution_tags"></a> [cloudfront\_distribution\_tags](#input\_cloudfront\_distribution\_tags) | CloudFront distribution tags | `map(string)` | `{}` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Any additional information about the CloudFront distribution | `string` | `null` | no |
| <a name="input_default_root_object"></a> [default\_root\_object](#input\_default\_root\_object) | Default file CloudFront serves when user accesses the root URL of the distribution | `string` | `"index.html"` | no |
| <a name="input_default_ttl"></a> [default\_ttl](#input\_default\_ttl) | Default TTL for cache policy | `number` | `3600` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The website domain, e.g. example.com | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the distribution is enabled to accept user requests | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment | `string` | n/a | yes |
| <a name="input_error_file_path"></a> [error\_file\_path](#input\_error\_file\_path) | Path to error.html file | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional default tags | `map(string)` | `{}` | no |
| <a name="input_index_file_path"></a> [index\_file\_path](#input\_index\_file\_path) | Path to index.html file | `string` | n/a | yes |
| <a name="input_is_ipv6_enabled"></a> [is\_ipv6\_enabled](#input\_is\_ipv6\_enabled) | Whether IPv6 is enabled | `bool` | `true` | no |
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | Maximum TTL for cache policy | `number` | `86400` | no |
| <a name="input_min_ttl"></a> [min\_ttl](#input\_min\_ttl) | Minimum TTL for cache policy | `number` | `0` | no |
| <a name="input_organisation"></a> [organisation](#input\_organisation) | The name of the organisation | `string` | `"alexgregorydotio"` | no |
| <a name="input_private_hosted_zone"></a> [private\_hosted\_zone](#input\_private\_hosted\_zone) | Whether route 53 domain corresponding to domain is private | `bool` | `false` | no |
| <a name="input_service"></a> [service](#input\_service) | The name of the service | `string` | n/a | yes |

## Outputs

No outputs.
