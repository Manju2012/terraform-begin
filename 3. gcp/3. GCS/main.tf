resource "google_storage_bucket" "gcs" {
  name = "tf-coursebuc-from-terraformm"
  storage_class = "ARCHIVE"
  location = "US-CENTRAL1"

  labels = {
    "env" = "tf_env"
    "dept" = "complience"
  }
  uniform_bucket_level_access = true
  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
  retention_policy {
    is_locked = true
    retention_period = 864000 #10 days in sec
  }
}


resource "google_storage_bucket_object" "picture" {
  name = "udemy"
  bucket = google_storage_bucket.gcs.name
  source = "u.PNG"
}