output "website_url" {
  description = "URL of the static website"
  value       = "https://storage.googleapis.com/${google_storage_bucket.website_bucket.name}/index.html"
}

output "bucket_name" {
  description = "Name of the Cloud Storage bucket"
  value       = google_storage_bucket.website_bucket.name
}

output "cdn_ip_address" {
  description = "IP address for the CDN (point your domain here)"
  value       = google_compute_global_address.website_ip.address
}

output "bucket_url" {
  description = "Direct bucket URL"
  value       = google_storage_bucket.website_bucket.url
}