# This file defines the resources that will be created

variable "bucket_name" {
  description = "Name of the S3 bucket for batch processing"
  type        = string
}

variable "batch_role_name" {
  description = "Name of the IAM role for batch processing"
  type        = string
}

resource "aws_s3_bucket" "batch_bucket" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_iam_role" "batch_role" {
  name = var.batch_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "batchoperations.s3.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "batch_policy" {
  name        = "S3BatchPolicy"
  description = "Policy for S3 batch processing"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:GetObject"],
        Effect   = "Allow",
        Resource = aws_s3_bucket.batch_bucket.arn,
      },
      {
        Action   = ["s3:PutObject"],
        Effect   = "Allow",
        Resource = aws_s3_bucket.batch_bucket.arn,
      }
      # Add more permissions as needed
    ],
  })
}

resource "aws_iam_role_policy_attachment" "batch_policy_attachment" {
  policy_arn = aws_iam_policy.batch_policy.arn
  role       = aws_iam_role.batch_role.name
}

output "bucket_name" {
  value = aws_s3_bucket.batch_bucket.id
}

output "role_name" {
  value = aws_iam_role.batch_role.name
}
