module "mongodb" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-mongodb"
    instance_type = "t3.small"
    subnet_id = local.database_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "mongodb"
        },
        {
            Name = "${local.ec2_name}-mongodb"
        }
    )
}
module "redis" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-redis"
    instance_type = "t2.micro"
    subnet_id = local.database_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "redis"
        },
        {
            Name = "${local.ec2_name}-redis"
        }
    )
}

module "mysql" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-mysql"
    instance_type = "t3.small"
    subnet_id = local.database_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "mysql"
        },
        {
            Name = "${local.ec2_name}-mysql"
        }
    )
}
module "rabbitmq" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-rabbitmq"
    instance_type = "t2.micro"
    subnet_id = local.database_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.rabbitmq_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "rabbitmq"
        },
        {
            Name = "${local.ec2_name}-rabbitmq"
        }
    )
}
module "catalogue" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-catalogue"
    instance_type = "t2.micro"
    subnet_id = local.private_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "catalogue"
        },
        {
            Name = "${local.ec2_name}-catalogue"
        }
    )
}
module "cart" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-cart"
    instance_type = "t2.micro"
    subnet_id = local.private_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.cart_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "cart"
        },
        {
            Name = "${local.ec2_name}-cart"
        }
    )
}
module "user" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-user"
    instance_type = "t2.micro"
    subnet_id = local.private_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.user_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "user"
        },
        {
            Name = "${local.ec2_name}-user"
        }
    )
}
module "shipping" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-shipping"
    instance_type = "t3.small"
    subnet_id = local.private_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.shipping_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "shipping"
        },
        {
            Name = "${local.ec2_name}-shipping"
        }
    )
}
module "payments" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-payments"
    instance_type = "t2.micro"
    subnet_id = local.private_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.payments_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "payments"
        },
        {
            Name = "${local.ec2_name}-payments"
        }
    )
}

module "web" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-web"
    instance_type = "t2.micro"
    associate_public_ip_address = "true"
    subnet_id = local.public_subnet_id
    vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
    tags = merge(
        var.common_tags,
        {
            component = "web"
        },
        {
            Name = "${local.ec2_name}-web"
        }
    )
}
module "ansible" {
    source = "terraform-aws-modules/ec2-instance/aws"
    ami = data.aws_ami.centos8.id
    name = "${local.ec2_name}-ansible"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.default.id
    vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
    user_data = file("ec2-provision.sh")
    tags = merge(
        var.common_tags,
        {
            component = "ansible"
        },
        {
            Name = "${local.ec2_name}-ansible"
        }
    )
}