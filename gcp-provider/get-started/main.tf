terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.61.0"
    }
  }
}

provider "google" {
  project = "ba-ux-poc-0c67"
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

resource "google_storage_bucket" "gcp1" {
  name     = "sumit-test-bucket-created-by-tf"
  location = "EU"
}