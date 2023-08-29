<<<<<<< HEAD
# Usage of TF S3 batch processing module

``` 
provider "aws" {
  region = "us-east-1"
  # Add your AWS credentials configuration here
}

module "s3_batch_processing" {
  source         = "./s3_batch_processing"
  bucket_name    = "my-batch-bucket"
  batch_role_name = "my-batch-role"
}
```
=======
# s3_batch_processing_module
Terraform module for S3 batch processing
>>>>>>> 2042830 (Initial commit)
