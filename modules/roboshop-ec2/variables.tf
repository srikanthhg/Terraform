variable "instance_id" {
    default = "t3.medium"
}

variable "tags" {
    type = map
    default = {
        Name = "roboshop"
        terraform = true
    }

}