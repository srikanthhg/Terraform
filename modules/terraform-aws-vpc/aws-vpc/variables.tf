variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16" # users can override
}
variable "enable_dns_hostnames" {
    type = bool
    default = true
}
variable "common_tags" {
    type = map
    default = {} # it is optional
}
variable "vpc_tags" {
    type = map
    default = {} 
}
variable "project_name" {
    type = string    #mandatory user must provide
}
variable "environment" {
    type = string
}
variable "igw_tags"{
    type = map
    default = {}
}
variable "public_subnets_cidr" {
    type = list
    validation{
        condition = length(var.public_subnets_cidr) == 2
        error_message = "please give 2 public valid subnet CIDR"
    }
}
variable "public_subnet_tags" {
    type = map
    default = {}
}
variable "private_subnets_cidr" {
    type = list
    validation{
        condition = length(var.private_subnets_cidr) == 2
        error_message = "please give 2 private valid subnet CIDR"
    }
 
}
variable "private_subnet_tags" {
    type = map
    default = {}
}
variable "database_subnets_cidr" {
    type = list
    validation{
        condition = length(var.database_subnets_cidr) == 2
        error_message = "please give 2 database valid subnet CIDR"
    }

}
variable "database_subnet_tags" {
    type = map
    default = {}
}

variable "nat_gateway_tags" {
    type = map
    default = {}
}

variable "public_route_table_tags" {
    type = map
    default = {}
}
variable "private_route_table_tags" {
    type = map
    default = {}
}
variable "database_route_table_tags" {
    type = map
    default = {}
}

variable "is_peering_required" {
    type = bool
    default = false
}
variable "acceptor_vpc_id" {
    type = string
    default = ""
}
variable "vpc_peering_tags" {
    type = map
    default = {}
}