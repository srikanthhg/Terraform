output "azs"{
    value = data.aws_availability_zones.azs.names
}
output "public_subnet"{
    value = aws_subnet.public[*].id
}

# output "account_id" {
#   value = data.aws_caller_identity.current.account_id
# }