resource "aws_instance" "web" {
  # count = 11  
  count = length(var.instance_names)
  ami = var.ami_id
  instance_type = var.instance_names[count.index]
  
  tags = {
    Name = "web - ${count.index+1}"
   # Component = var.instance_names[count.index]
  }
}

