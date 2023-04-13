resource "google_compute_instance" "vm-from-tf" {
  name         = "vm-from-tf"
  zone         = "europe-west1-b"
  machine_type = "n1-standard-1"
  # allow_stopping_for_update = true
  network_interface {
    network    = "sumit-test-vpc-created-custom-tf"
    subnetwork = "sub-sg"
  }
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20230411"
      size  = 25
    }
    auto_delete = false
  }
  labels = {
    "env" = "tflearning"
  }
  scheduling {
    preemptible       = false
    automatic_restart = false
  }

  lifecycle {
    ignore_changes = [
      attached_disk
    ]
  }
}

resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 15
  zone = "europe-west1-b"
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  disk     = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}
