# provisioners: only for ec2 instances
resource "aws_instance" "web" {
  ami           =  data.aws_ami.centos8.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop_all.id]
  tags = {
    Name = "HelloTerraform"
  }


  provisioner "local-exec" { # 
    command = "echo this will execute at the time of creation, you can trigger other system like email and sending alerts"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

  # provisioner "local-exec" {
  # command = "ansible-playbook -i inventory web.yaml" # this command will not run because ansible is not installed in this machine
  # on_failure = continue # this is same like ignore_errors: true in ansible
  # }

  provisioner "local-exec" { # 
    when = destroy
    command = "echo this will execute at the time of destroy, you can trigger other system like email and sending alerts"
  }

  connection{
    type = "ssh"
    user = "centos"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'this is from remote exec' > /tmp/rempte.txt",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_security_group" "roboshop_all" {
  name        = "provisioner"
  # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Allow All Ports"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "Allow All Ports"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0 # zero means allow all ports
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-all-aws"
  }
}
