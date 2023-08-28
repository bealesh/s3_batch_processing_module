# This file defines the input variables for the module.

variable "bucket_name" {
  description = "Name of the S3 bucket for batch processing"
  type        = string
}

variable "batch_role_name" {
  description = "Name of the IAM role for batch processing"
  type        = string
}
