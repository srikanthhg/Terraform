resource "aws_instance" "web" {
  # count = 11  
  count = length(var.instance_names)
  ami = var.ami_id
  instance_type = local.instance_type
  
  tags = {
    Name = "web-${count.index+1}"
    Component = var.instance_names[count.index]
  }
}

