
output "vpc_id" {
    value = data.aws_vpc.sv_vpc.id
}

output "vpc_name" {
    value = data.aws_vpc.sv_vpc.tags["Name"]
}
