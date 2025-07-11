provider "aws" {
region = var.region
access_key = ${{ secrets.AWS_ACCESS_KEY_ID }}
secret_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
}

# terraform state file setup
# create an S3 bucket for vpc to store the state file in

resource "aws_s3_bucket" "terraform-state-storage-s3-ak" {
   bucket = var.bucket_name
 
    versioning {
      enabled = true
    }
 
  #  lifecycle {
   #   prevent_destroy = true
  #  }
 
    tags = {
      Name = "S3 Bucket"
    }      
}



# create a dynamodb table for locking the state file
# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock-devops4solutions" {
#   name = "terraform-state-lock-dynamo-devops4solutions"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20
 
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
 
#   tags = {
#     Name = "DynamoDB Terraform State Lock Table for devops4solutions"
#   }
# }
