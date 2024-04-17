resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           =  data.aws_ami.centos8.id
  instance_type = each.value
  
  tags = {
    Name = each.key
  }
}

# resource "aws_route53_zone" "primary" {
#   name = "skanth306.xyz"
# }
# dont create route53 from here, it will create 2 times

resource "aws_route53_record" "records" {
  # count = 11
  # count = length(var.instance_names) 
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" # interpolation, mixing text with variable (general concept not a terraform concept)
  type    = "A"
  ttl     = 1
  # records = [aws_instance.web[count.index].private_ip]
  # records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
  records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip ]
}
# terraform init -backend-config=dev/backend.tf
# terraform plan -var-file=dev/dev.tfvars
# terraform apply -var-file=dev/dev.tfvars -auto-approve
# terraform destroy -var-file=dev/dev.tfvars -auto-approve

# terraform init -reconfigure -backend-config=prod/backend.tf
# terraform plan -var-file=prod/prod.tfvars
# terraform apply -var-file=prod/prod.tfvars -auto-approve
# terraform destroy -var-file=prod/prod.tfvars -auto-approve

# while switching environments, we need to do: 
# terraform init -reconfigure -backend-config=dev/backend.tf
# terraform init -reconfigure -backend-config=prod/backend.tf
