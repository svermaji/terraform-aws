data "aws_vpc" "sv_vpc" {
  filter {
    name   = "owner-id"
    values = ["${data.aws_caller_identity.current_user.account_id}"]
  }
}