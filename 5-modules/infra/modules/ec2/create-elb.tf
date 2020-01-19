resource "aws_elb" "sv_elb" {
  name                      = "sv-elb-${var.sv_cluster}"
  cross_zone_load_balancing = true
  security_groups           = [var.sv_default_sg_id, var.sv_elb_sg_id]
  subnets                   = [var.sv_subnet_pub_a_id]
  source_security_group     = var.sv_elb_sg_id

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
    lb_port            = 80
    lb_protocol        = "http"
  }

  health_check {
    # number of attempts
    healthy_threshold   = 4
    unhealthy_threshold = 4
    # response time in sec
    timeout             = 5
    target              = "HTTP:80/"
    # time between threshold calls in sec
    interval            = 60
  }

  idle_timeout                = 120
  connection_draining         = true
  connection_draining_timeout = 120

  tags = {
    Name = "sv-elb-${var.sv_cluster}"
    HSN = "sv-elb-${var.sv_cluster}"
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
