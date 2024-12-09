variable "project_id" {
  description = "The ID of the project in which to create the bucket"
  type        = string
}

variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "jackietest-9374864t"
}