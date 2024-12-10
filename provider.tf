terraform {
  required_version = "1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }

  # Configuring Terraform backend to store state file in an S3 bucket
  backend "s3" {
    # bucket = var.bucket_name                            # Specify the name of the S3 bucket to store the state file
    # region = var.bucket_region                          # Specify the AWS region where the bucket is located
    # key    = "jenkins-server/${var.env_prefix}.tfstate" # Specify the path within the bucket to store the state file
  }
}

provider "aws" {
  region = var.aws_region
}
