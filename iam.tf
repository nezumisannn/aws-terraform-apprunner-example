resource "aws_iam_role" "apprunner_service_role" {
  name = "apprunner-service-role"

  assume_role_policy = data.template_file.apprunner_service_assume_role_policy.rendered
}

resource "aws_iam_role_policy_attachment" "test-apprunner_service_role" {
  role       = aws_iam_role.apprunner_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}