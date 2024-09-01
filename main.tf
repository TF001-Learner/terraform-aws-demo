resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-terraform-demo-bucket-12345"  # Replace with a unique name

  tags = {
    Name = "My Terraform Demo Bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "example_bucket_ownership" {
  bucket = aws_s3_bucket.example_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.example_bucket_ownership]

  bucket = aws_s3_bucket.example_bucket.id
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.example_bucket.id
}