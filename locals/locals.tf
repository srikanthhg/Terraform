locals {
    name = "srikanth"
    training = "terraform"

    instance_type = var.isProd ? "t3.small" : "t2.micro"
    
    ip = var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip

}