provider "aws" {
    version = "~> 2.0"
    region  = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0"
    region  = "us-east-2"
}

resource "aws_instance" "dev" {
  count  = 3
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  tags = {
    Name = "dev${count.index}"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}
/*
resource "aws_instance" "dev4" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  tags = {
    Name = "dev4"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = ["aws_s3_bucket.dev4"]
}*/

resource "aws_instance" "dev5" {
  ami = "${var.amis["us-east-1"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  tags = {
    Name = "dev5"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  tags = {
    Name = "dev6"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = ["aws_dynamodb_table.dynamodb-homologacao"]
}

resource "aws_instance" "dev7" {
  provider = "aws.us-east-2"
  ami = "${var.amis["us-east-2"]}"
  instance_type = "t2.micro"
  key_name = "${var.key-name}"
  tags = {
    Name = "dev7"
  }

  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
  depends_on = ["aws_dynamodb_table.dynamodb-homologacao"]
}

/*
resource "aws_s3_bucket" "dev4" {
  bucket = "rmerceslabs-dev4"
  acl    = "private"
  tags = {
    Name = "rmerceslabs-dev4"
  }
}
*/

resource "aws_s3_bucket" "homologacao" {
  bucket = "rmerceslabs-homologacao"
  acl    = "private"
  tags = {
    Name = "rmerceslabs-homologacao"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = "aws.us-east-2"
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 0
    read_capacity      = 0
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}

