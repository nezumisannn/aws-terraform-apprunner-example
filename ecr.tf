resource "aws_ecr_repository" "nginx" {
  name                 = "app-runner-nginx"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}