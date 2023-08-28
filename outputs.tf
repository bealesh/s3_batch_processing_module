# This file defines the output values of the module.

output "bucket_name" {
  value = aws_s3_bucket.batch_bucket.id
}

output "role_name" {
  value = aws_iam_role.batch_role.name
}