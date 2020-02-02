resource "aws_iam_server_certificate" "sv_server_cert" {
  name             = "sv-server-cert"
  certificate_body = file("../../../../aws/sv-aws-cert.cer")
  private_key      = file("../../../../aws/sv-aws-private-key.pem")

  lifecycle {
    create_before_destroy = true
  }
}