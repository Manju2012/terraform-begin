# create bucket
# upload zip file
# delpoy function
# policy binnding


resource "google_storage_bucket" "func_bucket" {
  name = "func_bucket_tf-msn"
}


resource "google_storage_bucket_object" "src_code" {
  name = "cloud func.zip"
  bucket = google_storage_bucket.func_bucket.name
  source = "cloud func.zip"
}


resource "google_cloudfunctions_function" "func_from_tf" {
  name = "func_from_tf"
  runtime = "python37"
  description = "This is my 1st func from terraform"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.func_bucket.name
  source_archive_object = google_storage_bucket_object.src_code.name

  trigger_http = true
  entry_point = "hello_world_tf"
}


resource "google_cloudfunctions_function_iam_member" "allow_access" {
  region = google_cloudfunctions_function.func_from_tf.region
  cloud_function = google_cloudfunctions_function.func_from_tf.name

  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
  
}