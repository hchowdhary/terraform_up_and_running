provider "aws" {
  region = "ap-south-1"
  profile = "terraform"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "g24x7-himanshu-terraform-state"

  versioning {
    enabled = true
  }

  #lifecycle {
  #  prevent_destroy = true
  #}
}

