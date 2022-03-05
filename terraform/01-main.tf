terraform {
  backend "s3" {
    bucket     = "my-sandbox-tf-backend"
    region     = "us-east-1"
    key        = "test-task/terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}