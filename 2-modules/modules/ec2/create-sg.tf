resource "aws_security_group" "allow_me_sg" {
  name        = "Allow Me SG"
  description = "Allow My IP to inbound traffic"
  vpc_id      = var.sv_vpc_id

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }

  tags = {
    Name = "Allow Me SG"
    HSN  = "sv-sg-allow-me"
  }
}
