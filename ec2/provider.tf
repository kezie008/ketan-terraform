terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
  backend "s3" {
    # make sure bucket is already there 
    bucket = "ketan-terraform-state"
    key = "dev-env/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
    acl = "private"
    # make sure dynamodb table is present 
    dynamodb_table = "ketan-locktable"
    
  }

}

provider "aws" {
    region = var.region
      
}
