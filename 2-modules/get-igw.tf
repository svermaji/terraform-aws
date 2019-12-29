data "aws_internet_gateway" "sv_igw" {
  filter {
    name   = "owner-id"
    values = ["${data.aws_caller_identity.current_user.account_id}"]
  }
}