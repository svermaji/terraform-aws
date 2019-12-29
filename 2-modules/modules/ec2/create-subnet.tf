resource "aws_subnet" "sv_subnet_pub_a" {
  vpc_id     = var.sv_vpc_id
  cidr_block = "172.31.48.0/20"

  tags = {
    Name = "SV Public A"
    Type = "public"
    HSN  = "sv-subnet-public-a"
  }
}

resource "aws_subnet" "sv_subnet_pri_a" {
  vpc_id     = var.sv_vpc_id
  cidr_block = "172.31.64.0/20"

  tags = {
    Name = "SV Private A"
    Type = "private"
    HSN  = "sv-subnet-private-a"
  }
}

