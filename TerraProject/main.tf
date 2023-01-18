provider "google" {
    project = "codemite-gcp-assignment" 
    credentials = file ("Cd.json")    
    region = "asia-east1"
    zone = "asia-east1-b"
}
resource "google_compute_instance" "example" {
  name = "example"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  metadata = {
    startup-script = <<EOF
      #!/bin/bash
      # Install necessary packages
      sudo apt-get update
      sudo apt-get install -y apache2 php
      sudo apt install php
      sudo systemctl restart apache2
    EOF
  }

  network_interface {
    network = "default"

    access_config {
        //External Ip
    }
  }
}

resource "google_sql_database_instance" "example" {
  name = "example-instance"
  region = "asia-east1"
  database_version = "MYSQL_5_7"

  settings {
    tier = "db-n1-standard-1"
    backup_configuration {
      enabled = true
      start_time = "04:00"
    }
  }
}
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}
