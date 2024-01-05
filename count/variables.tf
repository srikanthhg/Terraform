variable "instance_names" {
    type = list
    default =  ["MongoDB", "Redis", "Mysql", "Rabbit MQ", "Catalogue", "Cart", "User", "Shipping", "payments", "Dispatch", "Web"]

}

variable "ami_id"{
  type = string
  default = "ami-03265a0778a880afb"
}