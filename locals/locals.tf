locals {
    name = "srikanth"

    instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Mysql" || var.instance_names[count.index] == "Shipping"  ? "t3.small" : "t2.micro"
    
    ip = var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip

}