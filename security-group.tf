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

resource "aws_security_group" "acesso-ssh-us-east-2" {
  provider = "aws.us-east-2"
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