data "aws_ami" "linux_ami" {
  most_recent = true
  // owners      = ["amazon"] # 137112412989
  owners      = ["761576524318"]
  # public      = true

  filter {
    # public   = true
    name   = "name"
//    values = ["amzn-ami-hvm-2018.03.0.20190514-x86_64-ebs"]
    values = ["packer-sv-encrypted-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
