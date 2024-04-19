data "aws_ami" "centos" {
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

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "us-east-1a"
}

data "aws_ssm_parameter" "vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/vpn_sg_id"
}