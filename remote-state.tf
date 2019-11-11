terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "terraform-pedropefj"

    workspaces {
      name = "aws-terraform-pedropefj"
    }
  }
}