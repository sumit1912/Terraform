resource "google_sql_database_instance" "sql-instance" {
  name = "sql-instance"
  deletion_protection = false
  database_version = "MYSQL_5_6"
  region = "europe-west1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "myuser" {
  name = "sumit"
  password = "sumit@123"
  instance = google_sql_database_instance.sql-instance.name
  
}