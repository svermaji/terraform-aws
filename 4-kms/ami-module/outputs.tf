output "pub_key_path_value" {
  value = var.pub_key_path
}

output "account_id" {
  value = data.aws_caller_identity.current_user.account_id
}

output "caller_user" {
  value = data.aws_caller_identity.current_user.user_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current_user.arn
}

output "caller_region" {
  value = data.aws_region.user_region.name
}

output "linux_ami_id" {
    value = data.aws_ami.linux_ami.id
}

output "igw_id" {
    value = data.aws_internet_gateway.sv_igw.id
}

output "igw_name" {
    value = data.aws_internet_gateway.sv_igw.tags["Name"]
}

output "vpc_id" {
    value = data.aws_vpc.sv_vpc.id
}

output "vpc_name" {
    value = data.aws_vpc.sv_vpc.tags["Name"]
}

output "default_asg" {
    value = data.aws_security_group.sv_default_sg.tags["Name"]
}

output "timestamp" {
  value = timestamp()
}