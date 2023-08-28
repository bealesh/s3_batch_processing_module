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