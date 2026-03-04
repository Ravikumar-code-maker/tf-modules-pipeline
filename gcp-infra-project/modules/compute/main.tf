resource "google_compute_instance" "vm" {
  name         = "${var.env_name}-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initial_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = "${var.env_name}-subnet"
    access_config {}
  }
}
