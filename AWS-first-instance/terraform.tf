// this check will run before running any terraform command like plan apply destroy.
terraform {
  required_version = ">= 1.17.1"

 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.71.0"
    }
  }
}