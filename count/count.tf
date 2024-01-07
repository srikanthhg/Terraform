# foreach loop is ued to iterate maps
# count loop is used to iterate list

resource "aws_instance" "web" {
  # count = 11  
  count = length(var.instance_names)
  ami = var.ami_id
  instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Mysql" || var.instance_names[count.index] == "Shipping"  ? "t3.small" : "t2.micro"
  
  tags = {
    Name = "web-${count.index+1}"
    Component = var.instance_names[count.index]
  }
}

