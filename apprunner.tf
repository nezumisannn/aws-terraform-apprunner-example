resource "aws_apprunner_service" "example" {
  service_name = var.project_name

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_service_role.arn
    }
    image_repository {
      image_configuration {
        port = "80"
      }
      image_identifier      = "${aws_ecr_repository.nginx.repository_url}:latest"
      image_repository_type = "ECR"
    }
  }

  network_configuration {
    egress_configuration {
      egress_type       = "VPC"
      vpc_connector_arn = aws_apprunner_vpc_connector.connector.arn
    }
  }

  tags = {
    Name = "${var.project_name}-service"
  }
}

resource "aws_apprunner_custom_domain_association" "example" {
  domain_name = var.apprunner_custom_domain
  service_arn = aws_apprunner_service.example.arn
}

resource "aws_apprunner_vpc_connector" "connector" {
  vpc_connector_name = "${var.project_name}-connector"
  subnets = [
    aws_subnet.public_1a.id,
    aws_subnet.public_1c.id,
    aws_subnet.public_1d.id,
  ]
  security_groups = [aws_security_group.apprunner.id]
}