output "public"{
    value = module.roboshop-ec2.public_ip
}

output "private"{
    value = module.roboshop-ec2.private_ip
}

output "instance_id"{
    value = module.roboshop-ec2.instance_id
}