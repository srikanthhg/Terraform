module "roboshop-ec2"{
    source = "../ec2"

    # if I want to use my own variables, I dont want to use default variables
    instance_type = var.instance_type
    tags = var.tags
}