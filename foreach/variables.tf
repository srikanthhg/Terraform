variable "instance_names" {
    type = map
    default =  {
      MongoDB = "t3.small"
      Redis = "t2.micro"
      Mysql = "t3.small"
      RabbitMQ = "t2.micro"
      Catalogue = "t2.micro"
      Cart = "t2.micro"
      User = "t2.micro"
      Shipping = "t3.small"
      payments = "t2.micro"
      Dispatch = "t2.micro"
      Web = "t2.micro"
    }

}

variable "ami_id"{
  type = string
  default = "ami-03265a0778a880afb"

}

variable "domain-name" {
  type = string
  default = "skanth306.xyz"
}
