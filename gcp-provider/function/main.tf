resource "google_storage_bucket" "fun_bucket" {
  name = "fun_bucket_tf3111"
  location = "europe-west1"
}

resource "google_storage_bucket_object" "srccode" {
  name = "Test.txt"
  bucket = google_storage_bucket.fun_bucket.name
  source = "Test.txt"
}

resource "google_cloudfunctions_function" "fun_from_tf" {
  name = "fun-from-tf"
  runtime = "nodejs14"
  description = "This is my first function from terraform"
  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.fun_bucket.name
  source_archive_object = google_storage_bucket_object.srccode.name
  trigger_http = true
  entry_point = "helloWorldtf"
}
