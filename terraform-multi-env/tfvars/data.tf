data "aws_ami" "centos8" {
  most_recent      = true
  owners = ["973714476881"] 
  # owners           = ["137112412989"] # account ID

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
    # values = ["amzn2-ami-kernel-5.10-hvm-*-arm64-gp2"]
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

data "aws_vpc" "default" {
    default = true
}

# data sources: it is useful to query the dynamic data from the provider as well as to query the existing resources(manually created) info. using that info we can create other resources.