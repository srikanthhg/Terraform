resource "aws_route53_zone" "primary" {
  name = "skanth306.xyz"
}

resource "aws_route53_record" "records" {
  # count = 11
  count = length(var.instance_names) 
  zone_id = aws_route53_zone.primary.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain-name}" # interpolation, mixing text with variable (general concept not a terraform concept)
  type    = "A"
  ttl     = 1
  # records = [aws_instance.web[count.index].private_ip]
  records = [var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}