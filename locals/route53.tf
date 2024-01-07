# resource "aws_route53_zone" "primary" {
#   name = "skanth306.xyz"
# }

# resource "aws_route53_record" "records" {
#   # count = 11
#   count = length(var.instance_names) 
#   zone_id = aws_route53_zone.primary.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain-name}" # interpolation, mixing text with variable (general concept not a terraform concept)
#   type    = "A"
#   ttl     = 1
#   # records = [aws_instance.web[count.index].private_ip]
#   records = [local.ip]
# }


resource "aws_instance" "web" {
  ami           =  var.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_all.id]

  tags = {
    Name = "locals"

  } 
}