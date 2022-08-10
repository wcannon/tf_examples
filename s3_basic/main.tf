resource "aws_s3_bucket" "a" {
  #bucket = "my-tf-test-bucket"
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}
