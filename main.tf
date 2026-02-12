terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a globally unique bucket name
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Cloud Storage bucket for static website hosting
resource "google_storage_bucket" "website_bucket" {
  name     = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  location = var.region
  
  # Enable website configuration
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  
  # Make bucket publicly readable for website hosting
  uniform_bucket_level_access = true
  
  labels = {
    environment = "dev"
    project     = "static-website"
  }
}

# Make bucket public for website access
resource "google_storage_bucket_iam_member" "public_read" {
  bucket = google_storage_bucket.website_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# Upload sample HTML files
resource "google_storage_bucket_object" "index_html" {
  name         = "index.html"
  bucket       = google_storage_bucket.website_bucket.name
  content_type = "text/html"
  source       = "website/index.html"
  depends_on   = [google_storage_bucket.website_bucket]
}

resource "google_storage_bucket_object" "not_found_html" {
  name         = "404.html"
  bucket       = google_storage_bucket.website_bucket.name
  content_type = "text/html"
  source       = "website/404.html"
  depends_on   = [google_storage_bucket.website_bucket]
}

# Cloud CDN for global distribution (optional, low cost)
resource "google_compute_backend_bucket" "website_backend" {
  name        = "website-backend-${random_id.bucket_suffix.hex}"
  bucket_name = google_storage_bucket.website_bucket.name
  enable_cdn  = true
}

resource "google_compute_url_map" "website_url_map" {
  name            = "website-url-map-${random_id.bucket_suffix.hex}"
  default_service = google_compute_backend_bucket.website_backend.self_link
}

resource "google_compute_target_https_proxy" "website_https_proxy" {
  name    = "website-https-proxy-${random_id.bucket_suffix.hex}"
  url_map = google_compute_url_map.website_url_map.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.website_ssl.self_link]
}

resource "google_compute_managed_ssl_certificate" "website_ssl" {
  name = "website-ssl-${random_id.bucket_suffix.hex}"
  
  managed {
    domains = [var.domain_name]
  }
}

resource "google_compute_global_forwarding_rule" "website_forwarding_rule" {
  name       = "website-forwarding-rule-${random_id.bucket_suffix.hex}"
  target     = google_compute_target_https_proxy.website_https_proxy.self_link
  port_range = "443"
  ip_address = google_compute_global_address.website_ip.address
}

resource "google_compute_global_address" "website_ip" {
  name = "website-ip-${random_id.bucket_suffix.hex}"
}