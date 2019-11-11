resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "Acesso SSH"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.cdirs_acesso_remoto}"

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
    cidr_blocks = "${var.cdirs_acesso_remoto}"
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso-web-external" {
  provider = "aws.us-east-2"
  name        = "acesso-web-external"
  description = "Acesso WEB External"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]

  }

  tags = {
    Name = "web-external"
  }
}

resource "aws_security_group" "acesso-web" {
  provider = "aws.us-east-2"
  name        = "acesso-web"
  description = "Acesso WEB"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]

  }

  tags = {
    Name = "web"
  }

}