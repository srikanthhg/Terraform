variable "ami_id"{
  type = string
  default = "ami-03265a0778a880afb"
}

variable "instance_type"{
  type = string
  default = "t2.micro"
}

variable "tags"{
  type = map
  default = {
    Name = "Hello Terraform"
    Project = "roboshop"
    Environment = "Dev"
    Terraform = "True"
    component = "Web"
  }
}

variable "sg-name"{
  type = string
 # default = "roboshop-all-aws"
}

variable "sg-description"{
  type = string
 # default = "Allow TLS inbound traffic"
}

variable "inbound-from-port"{
  type = number
  default = 0
}

variable "cidr_blocks"{
  type = list
  default = ["0.0.0.0/0"]
}

# if we want to override variable values here, we can write those values in terraform.tfvars
# terraform plan -var="instance_type=t3.medium"
# terraform plan -var-file="production.tfvars"
# variables precedence:
# 1. command line,
# 2. -var-file
# 3. terraform.tfvars
# 4. export TF_VAR_instance_type=t3.xlarge for linux, ENV variables: set TF_VAR_instance_type=t3.xlarge (if it is windows we can set environment variable like this, in linux we can use export here TF_VAR is mandatory)
# if the value is not available in above four points then terraform will prompt
