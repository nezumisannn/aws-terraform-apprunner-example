resource "aws_apprunner_service" "example" {
  service_name = "example"

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

  tags = {
    Name = "example-apprunner-service"
  }
}