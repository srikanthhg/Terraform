output "ami_id" {
    value = data.aws_ami.centos.id
}

output "vpc_info" {
    value = data.aws_vpc.default
}