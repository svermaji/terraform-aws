data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["amazon"] # 137112412989
#   public      = true

  filter {
    #public   = true
    name   = "name"
    values = ["amzn-ami-hvm-2018.03.0.20190514-x86_64-ebs"]
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

output "linux_ami_id" {
    value = data.aws_ami.linux_ami.id
}

#variable "var_linux_ami_id" {
#    type = string
#}

