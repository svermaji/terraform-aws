resource "aws_iam_role" "role_dev" {
  name = "dev-role"
  description = "SV Dev role"

  assume_role_policy = file("./modules/ec2/dev-assume-role-policy.json")

  tags = {
    Name = "SV Dev Role"
    HSN = "sv-role-dev"
  }
}