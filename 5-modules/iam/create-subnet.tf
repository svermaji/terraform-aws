resource "aws_subnet" "sv_subnet_pub_a" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.48.0/20"

  tags = {
    Name = "SV Public A"
    Type = "public"
    HSN  = "sv-subnet-public-a"
  }
}

resource "aws_subnet" "sv_subnet_pri_a" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.64.0/20"

  tags = {
    Name = "SV Private A"
    Type = "private"
    HSN  = "sv-subnet-private-a"
  }
}

/*
resource "aws_subnet" "sv_subnet_pub_b" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.80.0/20"

  tags = {
    Name = "SV Public B"
    Type = "public"
    HSN  = "sv-subnet-public-b"
  }
}

resource "aws_subnet" "sv_subnet_pri_b" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.96.0/20"

  tags = {
    Name = "SV Private B"
    Type = "private"
    HSN  = "sv-subnet-private-b"
  }
}

resource "aws_subnet" "sv_subnet_pub_c" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.110.0/20"

  tags = {
    Name = "SV Public C"
    Type = "public"
    HSN  = "sv-subnet-public-c"
  }
}

resource "aws_subnet" "sv_subnet_pri_c" {
  vpc_id     = data.aws_vpc.sv_vpc.id
  cidr_block = "172.31.126.0/20"

  tags = {
    Name = "SV Private C"
    Type = "private"
    HSN  = "sv-subnet-private-c"
  }
}

*/
