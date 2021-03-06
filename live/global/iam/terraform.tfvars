terragrunt = {
  remote_state {
    backend = "s3"
    config {
      encrypt = true
      bucket = "g24x7-himanshu-terraform-state"
      key = "global/iam/terraform.tfstate"
      region = "ap-south-1"
      dynamodb_table = "terraform-lock-table"
      
      s3_bucket_tags {
        owner = "terragrunt"
        name  = "Terraform state storage"
      }

      dynamodb_table_tags {
        owner = "terragrunt"
        name  = "Terraform lock table"
      }
    }
  }
}

user_names = ["neo", "trinity", "morpheus"]