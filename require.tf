# require.tf

terraform {
  required_version = "~> 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.30"
    }

    template = {
      source = "hashicorp/template"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
