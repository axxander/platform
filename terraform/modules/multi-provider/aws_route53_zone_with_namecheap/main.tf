resource "aws_route53_zone" "public" {
  name = var.domain
}

resource "namecheap_domain_records" "this" {
  domain = var.domain
  mode   = var.namecheap_mode

  nameservers = aws_route53_zone.public.name_servers
}
