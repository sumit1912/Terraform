resource "google_compute_network" "sumit-test-vpc-created-auto-tf" {
  name                    = "sumit-test-vpc-created-auto-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "sumit-test-vpc-created-custom-tf" {
  name                    = "sumit-test-vpc-created-custom-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-sg" {
  name          = "sub-sg"
  network       = google_compute_network.sumit-test-vpc-created-custom-tf.id
  ip_cidr_range = "10.1.0.0/24"
  region        = "europe-west1"
}

resource "google_compute_firewall" "allow_icmp" {
  name = "allow-icmp"
  network = google_compute_network.sumit-test-vpc-created-custom-tf.id  
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}

output "auto" {
  value = google_compute_network.sumit-test-vpc-created-auto-tf.id
}

output "custom" {
  value = google_compute_network.sumit-test-vpc-created-custom-tf.id
}

