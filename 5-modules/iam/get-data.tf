data "aws_security_group" "sv_default_sg" {

  vpc_id = data.aws_vpc.sv_vpc.id

  filter {
    name   = "group-name"
    values = ["default"]
  }

  filter {
    name   = "owner-id"
    values = [data.aws_caller_identity.current_user.account_id]
  }
}

data "aws_caller_identity" "current_user" {}

data "aws_region" "user_region" {}

data "aws_internet_gateway" "sv_igw" {
  filter {
    name   = "owner-id"
    values = [data.aws_caller_identity.current_user.account_id]
  }
}

data "aws_vpc" "sv_vpc" {
  filter {
    name   = "owner-id"
    values = [data.aws_caller_identity.current_user.account_id]
  }
}