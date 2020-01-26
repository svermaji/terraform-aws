
// Creating custom kms key in free tier might charge you, so be alert
resource "aws_kms_key" "sv_custom_kms_key" {
  description = "SV Custom key to protect EBS volume and encrypt AMI"
  is_enabled  = true
  key_usage   = "ENCRYPT_DECRYPT"
  policy = file("${path.module}/kms-key-policy.json")

  tags = {
    Name = "SV Custom Key"
    HSN = "sv-custom-kms-key"
  }
}

resource "aws_kms_alias" "sv_kms_alias" {
  name          = "alias/sv_kms_key"
  target_key_id = aws_kms_key.sv_custom_kms_key.key_id
}
