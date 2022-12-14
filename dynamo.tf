#Dyanamo table:
resource "aws_dynamodb_table" "state-lock" {
  hash_key       = "LockID"
  name           = "terraform-state-locks"
  write_capacity = 5
  read_capacity  = 5
  attribute {
    name = "LockID"
    type = "S"
  }
}