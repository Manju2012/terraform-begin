resource "google_cloud_run_service" "run-app-from-tf" {
  name = "run-app-from-tf"
  location = "us-central1"
  
  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello@sha256:e9cad8c3f185bc7ef07d976e8f260e94de0d954bf25f91a992f6445c8abc0940"
      }
    }
  }
}


resource "google_cloud_run_service_iam_policy" "pub_access" {
  service = google_cloud_run_service.run-app-from-tf.name
  location = google_cloud_run_service.run-app-from-tf.location
  policy_data = data.google_iam_policy.pub-1.policy_data
}

data "google_iam_policy" "pub-1" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}