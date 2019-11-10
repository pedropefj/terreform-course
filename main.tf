provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}
resource "aws_instance" "dev" {
  count  = 3
  ami = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }

  vpc_security_group_ids = ["sg-0b85f82c2147e0b67"] //aws ec2 describe-security-groups
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso SSH"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
        "201.17.210.184/32"
    ]
  }

  tags = {
    Name = "ssh"
  }
}

