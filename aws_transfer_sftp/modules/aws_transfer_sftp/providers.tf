terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# AWS Providers
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias = "aws_e1"
  region = "us-east-1"
}
