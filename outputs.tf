output "certificate_validation_records" {
  value = aws_apprunner_custom_domain_association.example.certificate_validation_records
}

output "service_id" {
  value = aws_apprunner_service.example.service_id
}

output "service_url" {
  value = aws_apprunner_service.example.service_url
}