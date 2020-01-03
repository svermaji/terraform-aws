resource "aws_iam_server_certificate" "sv_server_cert" {
  name             = "sv-server-cert"
  certificate_body = file("../../cert/cert.pem")
  private_key      = file("../../cert/key.pem")

  lifecycle {
    create_before_destroy = true
  }
}