resource "aws_elb" "sv_elb" {
  name                      = "sv-elb"
  #availability_zones        = ["eu-west-2a","eu-west-2b","eu-west-2c"]
  cross_zone_load_balancing = true
  security_groups           = [var.sv_default_sg_id, aws_security_group.sv_elb_sg.id]
  # subnets                   = [aws_subnet.sv_subnet_pub_a.id, aws_subnet.sv_subnet_pub_b.id, aws_subnet.sv_subnet_pub_c.id]
  subnets                   = [aws_subnet.sv_subnet_pub_a.id]
  source_security_group     = aws_security_group.sv_elb_sg.id

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_iam_server_certificate.sv_server_cert.arn
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 8000
    lb_protocol        = "http"
  }

  health_check {
    # number of attempts
    healthy_threshold   = 8
    unhealthy_threshold = 8
    # response time in sec
    timeout             = 50
    target              = "HTTP:80/"
    # time between threshold calls in sec
    interval            = 60
  }

  idle_timeout                = 600
  connection_draining         = true
  connection_draining_timeout = 600

  tags = {
    Name = "sv-elb"
    HSN = "sv-elb"
  }
}

resource "aws_load_balancer_policy" "sv_lb_policy_tls1" {
  load_balancer_name = aws_elb.sv_elb.name
  policy_name        = "sv-lb-policy-tls1"
  policy_type_name   = "SSLNegotiationPolicyType"

  policy_attribute {
    name  = "Reference-Security-Policy"
    value = "ELBSecurityPolicy-2016-08"
  }
}

/*
resource "aws_lb_ssl_negotiation_policy" "sv_elb_ssl_neg_policy" {
  name          = "sv-elb-ssl-neg-policy"
  load_balancer = aws_elb.sv_elb.id
  lb_port       = 443

  attribute {
    name  = "Protocol-TLSv1"
    value = "true"
  }

  attribute {
    name  = "Protocol-TLSv1.1"
    value = "false"
  }

  attribute {
    name  = "Protocol-TLSv1.2"
    value = "true"
  }

  attribute {
    name  = "Server-Defined-Cipher-Order"
    value = "true"
  }

  attribute {
    name  = "ECDHE-RSA-AES128-GCM-SHA256"
    value = "true"
  }

  attribute {
    name  = "AES128-GCM-SHA256"
    value = "true"
  }

  attribute {
    name  = "EDH-RSA-DES-CBC3-SHA"
    value = "false"
  }

}*/
