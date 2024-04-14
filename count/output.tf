output "instance_id" {
   value = aws_instance.web[*].id
   # value = aws_instance.web.*.id
   # value = aws_instance.web[count.index].id
  
}

output "public_ip" {
    value = aws_instance.web.public_ip
}

output "private_ip" {
    value = aws_instance.web.private_ip
}

output "route53-zone-id" {
    value = aws_route53_zone.primary.zone_id
}