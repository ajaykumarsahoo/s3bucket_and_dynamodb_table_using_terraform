output "s3-bucket-id" {
    value = aws_s3_bucket.state-bucket.id
}

output "dynamodb-table-id" {
    value = aws_dynamodb_table.state-lock.id
  
}