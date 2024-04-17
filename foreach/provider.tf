terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    dynamodb_table = "TableName"
  }
# we need to creat bucket manually and DynamoDB Partition key name should be LockID
}

provider "aws" {
  region = "us-east-1"

  # access_key = "my-access-key" dont give it here use- "aws configure"
  # secret_key = "my-secret-key"
  # Configuration options
}

# if you change the backend from remote to local or viceversa -->run this  -->terraform init -reconfigure