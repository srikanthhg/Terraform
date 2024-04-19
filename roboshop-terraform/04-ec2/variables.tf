variable "common_tags"{
    default = {
        project = "roboshop",
        terraform = "true",
        environment = "dev"
    }
}

variable "project_name"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}
