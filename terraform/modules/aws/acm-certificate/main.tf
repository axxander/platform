# create certificate for apex and wildcard domains
resource "aws_acm_certificate" "this" {
  domain_name               = var.domain
  validation_method         = "DNS"
  subject_alternative_names = ["*.${var.domain}"]

  tags = merge(
    var.certificate_manager_tags,
    var.extra_tags,
    {
      Name = var.domain
    }
  )

  # prevent downtime
  lifecycle {
    create_before_destroy = true
  }
}


data "aws_route53_zone" "this" {
  name         = var.domain
  private_zone = var.private_hosted_zone
}

# creating dns record for each domain covered by the certificate (2 in our case)
resource "aws_route53_record" "cname" {
  for_each = {
    for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.this.id
}

# waits for ACM to validate the certificate
resource "aws_acm_certificate_validation" "this" {
  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [for record in aws_route53_record.cname : record.fqdn]
}
