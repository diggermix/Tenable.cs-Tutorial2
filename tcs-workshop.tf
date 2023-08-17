terraform {
  backend "local" {
  }
  required_version = ">=0.13"
}

provider "aws" {
  # profile = "my_aws_creds"
  region = "eu-west-2"
}
#########################################################
# S3 Bucket
#########################################################
resource "aws_s3_bucket" "mf_ps_workshop_s3_001" {
  bucket = "mf-ps-workshop-s3-001-20230817"

  tags = {
    "Name"      = "jdlab-ps-workshop-s3-001-20230816"
    "Terraform" = "true"
  }
}

resource "aws_s3_bucket_versioning" "mf-ps-workshop-s3-001-versioning" {
  bucket = aws_s3_bucket.MF_ps_workshop_s3_001.id
  versioning_configuration {
    status = "Disabled"
  }
}
