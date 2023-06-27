resource "google_compute_instance" "vm-from-tf" {
  name = "vm-fom-tf"
  zone = "us-central1-a"
  machine_type = "f1-micro"

  allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20230615"
      size = 12
    }
    auto_delete = false
  }

  labels = {
    "env" = "tflearning"
  }

  scheduling {
    preemptible = true
    automatic_restart = false
  }

  service_account {
    email = "terraform-gcp@terraform-390010.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [ attached_disk ]
  }
}




resource "google_compute_disk" "disk-1" {
  name =  "disk-1"
  size = 10
  zone = "us-central1-a"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "a-disk" {
  disk = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}