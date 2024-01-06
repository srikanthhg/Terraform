output "instance_id" {
   value = aws_instance.web[*].id
   # value = aws_instance.web.*.id
   # value = aws_instance.web[count.index].id
  
}

output "route53-zone-id" {
    value = aws_route53_zone.primary.zone_id
}