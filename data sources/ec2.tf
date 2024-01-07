resource "aws_instance" "web" {
  ami           =  data.aws_ami.centos.id
  instance_type = "t2.micro"
  
  tags = {
    Name = "data-sources"
  }
}

