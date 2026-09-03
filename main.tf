terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "jenkins_demo" {
  bucket = "terraform-jenkins-demo-967612468"
}

output "bucket_name" {
  value = aws_s3_bucket.jenkins_demo.bucket
}
