terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

  backend "s3" {
    bucket         = "daws77s-remote-state" # Name of the S3 bucket where the state will be stored.
    key            = "ec2"             # Path within the bucket where the state will be read/written.
    region         = "us-east-1"            # AWS region of the S3 bucket.
    dynamodb_table = "daws76s-locking"      # DynamoDB table used for state locking.
    # encrypt        = true # Ensures the state is encrypted at rest in S3.
  }
}
# https://medium.com/@ganeshpondy/terraform-s3-backend-with-dynamodb-lock-f2cea55fa931

provider "aws" {
  region = "us-east-1"
  # Configuration options
}
