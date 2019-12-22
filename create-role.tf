resource "aws_iam_role" "role_dev" {
  name = "dev"
  description = "SV Dev role"

  assume_role_policy = file("dev-assume-role-policy.json")

  tags = {
    tag-role = "sv-role-dev"
  }
}