data "template_file" "apprunner_service_assume_role_policy" {
  template = file("./policy/apprunner_service_assume_role_policy.json")
} 