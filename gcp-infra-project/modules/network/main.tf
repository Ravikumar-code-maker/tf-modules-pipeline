resource "google_compute_network" "vpc" {
  name                    = "${var.env_name}-vpc"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.env_name}-subnet"
  ip_cidr-range = var.subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
}

# Apply firewall rules
resource "google_compute_firewall" "firewall" {
  for_each = { for r in var.firewall_rules : r.name => r  }
  name  = each.value.name
  network = google_compute_network.vpc.name

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }
  source_ranges = each.value.source_ranges
}
 
