resource "google_spanner_instance" "spanner-tf" {
  name = "spanner-tf"
  config = "regional-asia-south1"
  display_name = "Spanner from tf"
  num_nodes = 1
  labels = {
    "env" = "learning"
  }
}

resource "google_spanner_database" "database" {
  instance = google_spanner_instance.spanner-tf.name
  name     = "my-database"
  version_retention_period = "3d"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
}
