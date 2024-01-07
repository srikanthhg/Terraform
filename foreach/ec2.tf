resource "aws_instance" "web" {
  for_each = var.instance_names
  ami           =  var.ami_id
  instance_type = each.value
  
  tags = {
    Name = each.key
  }
}

resource "aws_route53_zone" "primary" {
  name = "skanth306.xyz"
}

resource "aws_route53_record" "records" {
  # count = 11
  # count = length(var.instance_names) 
  for_each = aws_instance.web
  zone_id = aws_route53_zone.primary.zone_id
  name    = "${each.key}.${var.domain-name}" # interpolation, mixing text with variable (general concept not a terraform concept)
  type    = "A"
  ttl     = 1
  # records = [aws_instance.web[count.index].private_ip]
  records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}

# output "instances_info" {
#   value = aws_instance.web
# }

