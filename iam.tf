resource "aws_iam_role" "apprunner_service_role" {
  name = "apprunner-service-role"
  assume_role_policy = templatefile(
    "./policy/assume_role_policy.tftpl",
    {
      service = [
        "build.apprunner.amazonaws.com",
        "tasks.apprunner.amazonaws.com"
      ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "apprunner_service_role" {
  role       = aws_iam_role.apprunner_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}