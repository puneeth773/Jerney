terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment and configure for remote state (recommended for teams)
   backend "s3" {
     bucket         = "project2-config-reddy-2026"
     key            = "terraform/terraform.tfstate"
     region         = "ap-south-1"
     use_lockfile   = true
     encrypt        = true
   }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Jerney"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
