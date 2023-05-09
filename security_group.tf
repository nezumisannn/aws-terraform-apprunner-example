resource "aws_security_group" "apprunner" {
  name        = "${var.project_name}-sg"
  description = "Security group for App Runner VPC connector"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_security_group_rule" "apprunner_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.apprunner.id
}