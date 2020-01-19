resource "aws_route_table" "sv_rt_pub_a" {
  vpc_id = data.aws_vpc.sv_vpc.id

  # route {
  #   cidr_block = "172.31.0.0/16"
  # }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.sv_igw.id
  }

  tags = {
    Name  = "SV Public A"
    Type = "public"
    HSN  = "sv-route-table-public-a"
  }

}

resource "aws_route_table" "sv_rt_pri_a" {
  vpc_id = data.aws_vpc.sv_vpc.id

  # route {
  #   cidr_block = "172.31.0.0/16"
  # }

  tags = {
    Name  = "SV Private A"
    Type = "private"
    HSN  = "sv-route-table-private-a"
  }

}

