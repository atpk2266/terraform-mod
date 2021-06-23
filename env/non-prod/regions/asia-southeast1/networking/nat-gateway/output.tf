output "cloud_nat_name" {
  description = "Name of the Cloud NAT"
  value       = module.cloud-nat.name
}

output "addresses" {
  description = "List of address values managed by this module (e.g. [\"1.2.3.4\"])"
  value       = google_compute_address.address.*.address
}