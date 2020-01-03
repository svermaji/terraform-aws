
locals {
  sg_cidr_block = ["88.109.149.34/32", "88.109.149.0/28"]
}

resource "aws_security_group" "sv_ec2_sg" {
  name        = "Allow EC2 SG"
  description = "Allow EC2 to inbound traffic"
  vpc_id      = var.sv_vpc_id

  tags = {
    Name = "Allow EC2 SG"
    HSN  = "sv-ec2-sg"
  }
}

resource "aws_security_group" "sv_elb_sg" {
  name        = "Allow ELB SG"
  description = "Allow ELB to inbound traffic"
  vpc_id      = var.sv_vpc_id

  tags = {
    Name = "Allow ELB SG"
    HSN  = "sv-ec2-sg"
  }
}

resource "aws_security_group_rule" "allow_elb_http_in" {
  type            = "ingress"
  description     = "inbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_http_out" {
  type            = "egress"
  description     = "outbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_https_in" {
  type            = "ingress"
  description     = "inbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_https_out" {
  type            = "egress"
  description     = "outbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}


resource "aws_security_group_rule" "allow_ec2_ssh_in" {
  type            = "ingress"
  description     = "inbound rule for ssh"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_ssh_out" {
  type            = "egress"
  description     = "outbound rule for ssh"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_http_in" {
  type            = "ingress"
  description     = "inbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_http_out" {
  type            = "egress"
  description     = "outbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_https_in" {
  type            = "ingress"
  description     = "inbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_https_out" {
  type            = "egress"
  description     = "outbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = local.sg_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}
