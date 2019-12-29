provider "aws" {
  profile    = "default"
  region     = "eu-west-2"
}

module "ec2" {
  source = "./modules/ec2"
  pub_key_path = var.pub_key_path
  sv_vpc_id = data.aws_vpc.sv_vpc.id
  sv_igw_id = data.aws_internet_gateway.sv_igw.id
  linux_ami_id = data.aws_ami.linux_ami.id
}