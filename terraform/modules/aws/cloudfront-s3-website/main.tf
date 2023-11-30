locals {
  cloudfront_origin_id = format("%s-origin-id", var.domain)
}


## ---------------------------------------------------------------------------------------------------------------------
## S3 RESOURCES
## ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "domain" {
  bucket = var.domain

  tags = merge(
    var.bucket_tags,
    var.extra_tags,
    {
      Name = var.domain
    }
  )
}

data "aws_iam_policy_document" "domain_public_read" {
  statement {
    sid = "AllowCloudFrontServicePrincipalReadOnly"
    actions = [
      "s3:GetObject",
      "s3:ListBucket",  # required to get 404 error on objects that do not exist
    ]
    resources = [
      "${aws_s3_bucket.domain.arn}",
      "${aws_s3_bucket.domain.arn}/*",
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values = [
        aws_cloudfront_distribution.this.arn,
      ]
    }
  }
}

resource "aws_s3_bucket_policy" "domain" {
  bucket = aws_s3_bucket.domain.id
  policy = data.aws_iam_policy_document.domain_public_read.json
}

resource "aws_s3_bucket_website_configuration" "domain" {
  bucket = aws_s3_bucket.domain.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.domain.id
  key    = "index.html"
  source = var.index_file_path
  content_type = "text/html"
  etag   = filemd5(var.index_file_path)
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.domain.id
  key    = "error.html"
  source = var.error_file_path
  content_type = "text/html"
  etag   = filemd5(var.error_file_path)
}


## ---------------------------------------------------------------------------------------------------------------------
## CLOUDFRONT RESOURCES
## ---------------------------------------------------------------------------------------------------------------------

# Fetch certificates: they must reside in us-east-1 for CloudFront
data "aws_acm_certificate" "this" {
  domain   = var.domain
  statuses = ["ISSUED"]

  provider = aws.us_east_1
}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = aws_s3_bucket_website_configuration.domain.website_endpoint
  description                       = "${var.domain} origin access control (OAC)"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_cache_policy" "this" {
  name        = replace(var.domain, ".", "dot")
  min_ttl     = var.min_ttl
  max_ttl     = var.max_ttl
  default_ttl = var.default_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name              = aws_s3_bucket.domain.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    origin_id                = local.cloudfront_origin_id
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment
  default_root_object = var.default_root_object

  aliases = [
    var.domain,
    format("www.%s", var.domain),
  ]

  custom_error_response {
    error_caching_min_ttl = 0
    error_code            = 404
    response_code         = 200
    response_page_path    = "/error.html"
  }

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD",
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    cache_policy_id        = aws_cloudfront_cache_policy.this.id
    target_origin_id       = local.cloudfront_origin_id
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.this.arn
    ssl_support_method  = "sni-only"
    # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/secure-connections-supported-viewer-protocols-ciphers.html
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = merge(
    var.cloudfront_distribution_tags,
    var.extra_tags,
  )
}


## ---------------------------------------------------------------------------------------------------------------------
## ROUTE 53
## Map custom apex domain and www subdomain to the domain name of the CloudFront distribution
## ---------------------------------------------------------------------------------------------------------------------

data "aws_route53_zone" "this" {
  name         = var.domain
  private_zone = var.private_hosted_zone
}

resource "aws_route53_record" "apex" {
  name    = var.domain
  type    = "A"
  zone_id = data.aws_route53_zone.this.id

  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  name    = format("www.%s", var.domain)
  type    = "A"
  zone_id = data.aws_route53_zone.this.id

  alias {
    name                   = aws_cloudfront_distribution.this.domain_name
    zone_id                = aws_cloudfront_distribution.this.hosted_zone_id
    evaluate_target_health = false
  }
}
