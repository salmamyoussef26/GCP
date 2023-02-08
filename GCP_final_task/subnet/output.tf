output "manag_subnet_name"{
    value = google_compute_subnetwork.management-subnet.name
}

output "manag_region_name"{
    value = google_compute_subnetwork.management-subnet.region
}