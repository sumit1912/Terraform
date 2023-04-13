resource google_storage_bucket gcp1 {
  name          = "sumit-test-bucket-created-by-tf"
  location      = "EU"
  storage_class = "STANDARD"
  labels = {
    "env" = "tf_env"
    "dep" = "compliance"
  }
}

resource "google_storage_bucket_object" "name" {
  name   = "Test.txt"
  source = "Test.txt"
  bucket = google_storage_bucket.gcp1.name
}


