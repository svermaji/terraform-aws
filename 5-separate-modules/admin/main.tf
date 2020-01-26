provider "aws" {
  profile    = "default"
  region     = "eu-west-2"
}

module "admin" {
  source = "./modules/admin"
  sv_vpc_id = data.aws_vpc.sv_vpc.id
}
