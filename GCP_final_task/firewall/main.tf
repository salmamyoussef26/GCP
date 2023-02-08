resource "google_compute_firewall" "allow-ssh-using-iap" {
  name    = var.firewall_name
  network = var.vpc_name

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_tags = var.vms_to_be_accessed
  source_ranges = var.iap-ip
}