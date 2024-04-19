output "azs" {
    value = module.roboshop.azs
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}
