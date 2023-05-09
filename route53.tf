data "aws_route53_zone" "selected" {
  name = var.route53_hosted_zone
}

# Run after App Runner is created
resource "aws_route53_record" "acm_validations" {
  for_each = { for i in aws_apprunner_custom_domain_association.example.certificate_validation_records : i.name => i }
  zone_id  = data.aws_route53_zone.selected.zone_id
  name     = replace(each.value.name, ".${var.route53_hosted_zone}", "")
  type     = "CNAME"
  ttl      = 60
  records  = [each.value.value]
}

resource "aws_route53_record" "apprunner_custom_domain" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.apprunner_custom_domain
  type    = "A"

  alias {
    name                   = aws_apprunner_service.example.service_url
    zone_id                = var.apprunner_alias_host_zone_id
    evaluate_target_health = true
  }
}