terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.31.0"
    }
  }

  backend "s3" {
    bucket  = "devops-ci-iac-alvaro-0226"
    key     = "state/terraform.tfstate"
    region  = "us-east-2"
    profile = "AdministratorAccess-530482047728"
  }
}

provider "aws" {
  region  = "us-east-2"
  profile = "AdministratorAccess-530482047728"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "devops-ci-iac-alvaro-0226"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "devops-ci-iac-alvaro-0226"
  versioning_configuration {
    status = "Enabled"
  }
}