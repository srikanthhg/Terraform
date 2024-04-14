terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }
}

provider "aws" {
  region = "us-east-1"

  # access_key = "my-access-key" dont give it here use- "aws configure"
  # secret_key = "my-secret-key"
  # Configuration options
}