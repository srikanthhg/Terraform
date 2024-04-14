locals {
    name = "srikanth"
    training = "terraform"

    instance_type = var.isProd ? "t3.small" : "t2.micro"
    #instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Mysql" || var.instance_names[count.index] == "Shipping"  ? "t3.small" : "t2.micro"
    
    ip = var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip
}
# we dont write [count.index] here. locals dont have access to [count.index]. only write in main.tf file
# not a good example
