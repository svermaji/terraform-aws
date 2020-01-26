data "aws_ami" "linux_ami" {
  most_recent = true
  // owners      = ["amazon"] # 137112412989
  owners      = ["761576524318"]
  # public      = true

  filter {
    # public   = true
    name   = "name"
//    values = ["amzn-ami-hvm-2018.03.0.20190514-x86_64-ebs"]
    values = ["packer-sv-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

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

data "aws_security_group" "sv_elb_sg" {

  vpc_id = data.aws_vpc.sv_vpc.id

  filter {
    name   = "group-name"
    values = ["sv-elb-sg"]
  }

  filter {
    name   = "owner-id"
    values = [data.aws_caller_identity.current_user.account_id]
  }
}

data "aws_security_group" "sv_ec2_sg" {

  vpc_id = data.aws_vpc.sv_vpc.id

  filter {
    name   = "group-name"
    values = ["sv-ec2-sg"]
  }

  filter {
    name   = "owner-id"
    values = [data.aws_caller_identity.current_user.account_id]
  }
}

data "aws_subnet" "sv_subnet_pub_a" {

  vpc_id = data.aws_vpc.sv_vpc.id

  filter {
    name   = "tag:HSN"
    values = ["sv-subnet-public-a"]
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