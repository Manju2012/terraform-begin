terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "3.85.0"
    }
  }
}

provider "google" {
#   config options
    project = "terraform-390010"
    region = "us-central1"
    zone = "us-central1-a"
}


resource "google_storage_bucket" "gcs1" {
  name = "buckett-from-tf"
}