variable "amis" {
    type = "map"
    default = {
        "us-east-1" = "ami-04b9e92b5572fa0d1"
        "us-east-2" = "ami-0d5d9d301c853a04a"
    }
}

variable "cdirs_acesso_remoto" {
  type = "list"
  default = [
      "201.17.210.184/32"
      ]
}

variable "key-name" {
    type = "string"
    default = "terraform-aws"
}



 