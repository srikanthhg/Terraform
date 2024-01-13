# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "daws76s-remote-state"

# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "daws76s-locking"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }