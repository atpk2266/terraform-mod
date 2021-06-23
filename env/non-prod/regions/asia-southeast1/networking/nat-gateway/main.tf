/******************************************
  Resource for External Static IPs
 *****************************************/

resource "google_compute_address" "address" {
  count  = var.countnum
  name   = "roposo-nat-gw-ext-ip-${count.index}"
  region = var.region
}

/******************************************
  Resource for Cloud Router for NAT GW
 *****************************************/

resource "google_compute_router" "router" {
  name    = "${var.network_name}-nat-router"
  region  = var.region
  network = var.network_name
}

/******************************************
  Module for NAT Gateway
 *****************************************/

module "cloud-nat" {
  source = "../../../../../../modules/networking/nat-gateway"

  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = "${var.network_name}-nat-gw"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = var.min_ports_per_vm
  icmp_idle_timeout_sec              = var.icmp_idle_timeout_sec
  tcp_established_idle_timeout_sec   = var.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec    = var.tcp_transitory_idle_timeout_sec
  udp_idle_timeout_sec               = var.udp_idle_timeout_sec
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}