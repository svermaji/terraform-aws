
locals {
  all_cidr_block = ["88.0.0.0/8"]
}

resource "aws_security_group" "sv_ec2_sg" {
  name        = "sv-ec2-sg"
  description = "allow ec2 to inbound traffic"
  vpc_id      = data.aws_vpc.sv_vpc.id

  tags = {
    Name = "allow ec2 sg"
    HSN  = "sv-ec2-sg"
  }
}

resource "aws_security_group" "sv_elb_sg" {
  name        = "sv-elb-sg"
  description = "allow elb to inbound traffic"
  vpc_id      = data.aws_vpc.sv_vpc.id

  tags = {
    Name = "allow elb sg"
    HSN  = "sv-elb-sg"
  }
}

# Unless this rule is not added traffic does not goes through
# But this works for all protocols
resource "aws_security_group_rule" "allow_elb_http_for_all_in" {
  type            = "ingress"
  description     = "inbound rule for http for all"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = local.all_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_http_out" {
  type            = "egress"
  description     = "outbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_ec2_sg.id
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_https_in" {
  type            = "ingress"
  description     = "inbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks     = local.all_cidr_block
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_elb_https_out" {
  type            = "egress"
  description     = "outbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_ec2_sg.id
  security_group_id = aws_security_group.sv_elb_sg.id
}

resource "aws_security_group_rule" "allow_ec2_ssh_in" {
  type            = "ingress"
  description     = "inbound rule for ssh"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = local.all_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}

resource "aws_security_group_rule" "allow_ec2_ssh_out" {
  type            = "egress"
  description     = "outbound rule for ssh"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = local.all_cidr_block
  security_group_id = aws_security_group.sv_ec2_sg.id
}


resource "aws_security_group_rule" "allow_ec2_http_in" {
  type            = "ingress"
  description     = "inbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_elb_sg.id
  security_group_id = aws_security_group.sv_ec2_sg.id
}

/*resource "aws_security_group_rule" "allow_ec2_http_out" {
  type            = "egress"
  description     = "outbound rule for http"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_elb_sg.id
  security_group_id = aws_security_group.sv_ec2_sg.id
}*/

resource "aws_security_group_rule" "allow_ec2_https_in" {
  type            = "ingress"
  description     = "inbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_elb_sg.id
  security_group_id = aws_security_group.sv_ec2_sg.id
}

/*
resource "aws_security_group_rule" "allow_ec2_https_out" {
  type            = "egress"
  description     = "outbound rule for https"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  #cidr_blocks     = aws_security_group.sv_elb_sg.id
  source_security_group_id = aws_security_group.sv_elb_sg.id
  security_group_id = aws_security_group.sv_ec2_sg.id
}
*/
