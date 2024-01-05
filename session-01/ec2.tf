resource "aws_instance" "web" {
  ami           =  var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.roboshop_all.id]

  tags = var.tags
}

