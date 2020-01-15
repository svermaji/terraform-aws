resource "aws_route_table" "sv_rt_pub_a" {
  vpc_id = var.sv_vpc_id

  # route {
  #   cidr_block = "172.31.0.0/16"
  # }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.sv_igw_id
  }

  tags = {
    Name  = "SV Public A"
    Type = "public"
    HSN  = "sv-route-table-public-a"
  }

}

resource "aws_route_table" "sv_rt_pri_a" {
  vpc_id = var.sv_vpc_id

  # route {
  #   cidr_block = "172.31.0.0/16"
  # }

  tags = {
    Name  = "SV Private A"
    Type = "private"
    HSN  = "sv-route-table-private-a"
  }

}

