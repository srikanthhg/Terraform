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

# data sources: it is useful to query the dynamic data from the provider as well as to query the existing resources(manually created) info. using that info we can create other resources.
data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

