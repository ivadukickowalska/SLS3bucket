# providers.tofu - Provider configurations
terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
    aws = {
      source  = "opentofu/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6.0"
}

# Configure the AWS Provider
provider "aws" {
  default_tags {
    tags = {
      ManagedBy   = "OpenTofu"
      Environment = "prod"
    }
  }
}

# Configure the Spacelift Provider
provider "spacelift" {
  api_key_endpoint = var.spacelift_api_key_endpoint
  api_key_id       = var.spacelift_api_key_id
  api_key_secret   = var.spacelift_api_key_secret
}
