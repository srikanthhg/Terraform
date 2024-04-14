variable "ingress_rules"{
  default = [
    {
        description      = "Allow port 80"
        from_port        = 80 # all ports allowing
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow port 443"
        from_port        = 443 # all ports allowing
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    },
    {
        description      = "Allow port 22"
        from_port        = 22 # all ports allowing
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

  ]
}
