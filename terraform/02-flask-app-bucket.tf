resource "aws_kms_key" "flask-app-test-kms" {
  description             = "Key for encrypt"
}

resource "aws_s3_bucket" "flask-app-test-bucket" {
  bucket = "flask-app-test-bucket"

}

resource "aws_s3_bucket_acl" "flask-app-test-acl" {
  bucket = aws_s3_bucket.flask-app-test-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "flask-app-test-block" {
  bucket                    = aws_s3_bucket.flask-app-test-bucket.id

  block_public_acls         = true
  block_public_policy       = true
  ignore_public_acls        = true
  restrict_public_buckets   = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "flask-app-test-encrypt" {
  bucket = aws_s3_bucket.flask-app-test-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.flask-app-test-kms.arn
      sse_algorithm     = "aws:kms"
    }
  }
}