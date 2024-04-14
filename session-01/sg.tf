resource "aws_security_group" "roboshop_all" {
  name        = var.sg-name
  description = var.sg-description
  # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow All Ports"
    from_port        = var.inbound-from-port # all ports allowing
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0 # zero means allow all ports
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }
}