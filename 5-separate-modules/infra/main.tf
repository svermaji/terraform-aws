provider "aws" {
  profile    = "default"
  region     = "eu-west-2"
}

module "ec2" {
  source = "./modules/ec2"
  pub_key_path = var.pub_key_path
  linux_ami_id = data.aws_ami.linux_ami.id
  sv_default_sg_id = data.aws_security_group.sv_default_sg.id
  sv_ec2_sg_id = data.aws_security_group.sv_ec2_sg.id
  sv_elb_sg_id = data.aws_security_group.sv_elb_sg.id
  sv_subnet_pub_a_id = data.aws_subnet.sv_subnet_pub_a.id
  sv_cluster = "cluster-1"
}

