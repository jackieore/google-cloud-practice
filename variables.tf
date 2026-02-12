variable "project_id" {
  description = "The Google Cloud Project ID"
  type        = string
  # This will be set via terraform.tfvars (not tracked in git)
}

variable "region" {
  description = "The Google Cloud region to create resources in"
  type        = string
  default     = "us-central1"
}

variable "bucket_prefix" {
  description = "Prefix for the storage bucket name (will be made unique)"
  type        = string
  default     = "jackie-website"
}

variable "domain_name" {
  description = "Domain name for the website (optional, for SSL certificate)"
  type        = string
  default     = "example.com" # Change this to your domain or remove SSL resources if not needed
}