resource "google_compute_subnetwork" "management-subnet" {
name = var.manag-subnet-name
ip_cidr_range = var.manag-subnet-cidr
region = var.manag-subnet-region
network = var.subnet-network
//project = var.project
}

resource "google_compute_subnetwork" "restricted-subnet" {
name = var.restricted-subnet-name
ip_cidr_range = var.restricted-subnet-cidr
region = var.restricted-subnet-region
network = var.subnet-network
//project = var.project
}