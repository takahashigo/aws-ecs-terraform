terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  backend "s3" {
    bucket         = "aws-ecs-terraform-tfstate-tutorial"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "aws-ecs-terraform-tfstate-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region = local.region
}
