# dynamic block: if a particular block inside the resource conf is getting repeated
resource "aws_security_group" "roboshop_all" {
  name        = "dynamic-demo"
  description = "dynamic-demo"
  # vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description      = ingress.value["description"]
      from_port        = ingress.value["from_port"] # all ports allowing
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
    }
  }

  egress {
    from_port        = 0 # zero means allow all ports
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "dynamic-demo"
  }
}