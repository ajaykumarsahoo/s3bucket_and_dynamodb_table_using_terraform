#Encryption using KMS key:
resource "aws_kms_key" "mykey" {
  description             = "s3 backend key"
  deletion_window_in_days = 7
}

#S3 bucket:
resource "aws_s3_bucket" "state-bucket" {
  bucket = "terraform-backend-statefile-dev"
}

resource "aws_s3_bucket_acl" "state-bucket-acl" {
  bucket = aws_s3_bucket.state-bucket.id
  acl    = "private"
}

#Versisoning Enable:
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
#Server side encryption for S3 bucket:
resource "aws_s3_bucket_server_side_encryption_configuration" "sse_configuration_example" {
  bucket = aws_s3_bucket.state-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block_example" {
  bucket = aws_s3_bucket.state-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}