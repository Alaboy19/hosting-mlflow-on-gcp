resource "google_sql_database_instance" "instance" {
  project          = var.project_id
  name             = "my-valid-sql-instance"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier              = "db-f1-micro"
    availability_type = "ZONAL" 

    disk_autoresize = true  // Enable autoresize, adjust if needed
    disk_size       = 10
    disk_type       = "PD_HDD"

    ip_configuration {
      ipv4_enabled    = true
      authorized_networks {
        value           = var.vpn_to_access_db 
      }
    }
  }
}

resource "google_sql_database" "database" {
  name     = "my-valid-sql-database"
  instance = "my-valid-sql-instance"
}

resource "google_sql_user" "user" {
  name     = "root"
  instance = "my-valid-sql-instance"
  password = "qwerty123"
}


