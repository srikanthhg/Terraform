module "vpn"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "vpn"
    sg_description = "SG for vpn"
    vpc_id = data.aws_vpc.default.id
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mongodb"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mongodb"
    sg_description = "SG for MongoDB"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "redis"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "redis"
    sg_description = "SG for redis"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mysql"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    sg_description = "SG for mysql"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "rabbitmq"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "rabbitmq"
    sg_description = "SG for rabbitmq"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "catalogue"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "catalogue"
    sg_description = "SG for catalogue"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "user"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "user"
    sg_description = "SG for user"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "cart"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "cart"
    sg_description = "SG for cart"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "shipping"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "shipping"
    sg_description = "SG for shipping"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "payment"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "payment"
    sg_description = "SG for payment"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web"{
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    sg_name = "web"
    sg_description = "SG for web"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    # sg_ingress_rules = var.mongodb_sg_ingress_rules
}

# openvpn
resource "aws_security_group_rule" "vpn_home" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1" # all ports allowing
  security_group_id = module.vpn.sg_id
  cidr_blocks      = ["0.0.0.0/0"] # ideally your home public ip address
}


# mongodb accepting connections from catalogue instances
resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
  source_security_group_id = module.catalogue.sg_id
}

# mongodb accepting connections from user instances
resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
  source_security_group_id = module.user.sg_id
}

# mongodb accepting connections from vpn
resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
  source_security_group_id = module.vpn.sg_id
}

# redis accepting connections from user instances
resource "aws_security_group_rule" "redis_user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
  source_security_group_id = module.user.sg_id
}

# redis accepting connections from cart instances
resource "aws_security_group_rule" "redis_cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
  source_security_group_id = module.cart.sg_id
}