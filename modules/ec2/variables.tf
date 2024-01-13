variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"

}

variable "instance_id" {
    type = string
    default = "t2.micro"
    
}

variable "tags" {
    type = map
    default = {}
    
}