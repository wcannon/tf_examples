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

output aws_transfer_server-company-sftp-arn {
    value = aws_transfer_server.company_sftp.arn
}

output aws_transfer_server-company-sftp-id {
    value = aws_transfer_server.company_sftp.id
}

output aws_transfer_server-company-sftp-endpoint {
    value = aws_transfer_server.company_sftp.endpoint
}

output aws_transfer_server-company-sftp-host-key-fingerprint {
    value = aws_transfer_server.company_sftp.host_key_fingerprint
}

output aws_transfer_server-company-sftp-tags-all{
    value = aws_transfer_server.company_sftp.tags_all
}