
resource "aws_iam_group_membership" "dev_team" {
  name = "dev-group-membership"

  users = [
    "svdev"
  ]

  group = aws_iam_group.grp_dev.name
}

