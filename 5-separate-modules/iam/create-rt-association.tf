resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.sv_subnet_pub_a.id
  route_table_id = aws_route_table.sv_rt_pub_a.id
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.sv_subnet_pri_a.id
  route_table_id = aws_route_table.sv_rt_pri_a.id
}
