variable "instance_names" {
    type = map
    # default =  {
    #     MongoDB = "t3.small"
    #     Redis = "t2.micro"
    #     Mysql = "t3.small"
    #     Web = "t2.micro"
    # }

}

variable "zone_id"{
    default = "Z0967620192SXU3J88Y7D"
}

variable "domain_name" {
    default = "skanth306.xyz"
}