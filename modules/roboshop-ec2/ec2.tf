module "roboshop_ec2" {
    source = "../ec2"
    instance_id = var.instance_id
    tags = var.tags
}
