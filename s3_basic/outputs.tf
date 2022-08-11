output "S3-Bucket-ID" {
    value = aws_s3_bucket.a.id
}

output "S3-Bucket-ARN" {
    value = aws_s3_bucket.a.arn
}

output "S3-Region" {
    value = aws_s3_bucket.a.region
}

output "S3-Bucket-Tags" {
    value = aws_s3_bucket.a.tags_all
}