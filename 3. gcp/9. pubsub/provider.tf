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
    credentials = "keys.json"
}


