variable "project_id" {
  description = "Project ID to reserve static IPs"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.project_id))
    error_message = "Project ID is invalid."
  }
}
variable "region" {
  description = "Region to reserve static IPs"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Region is invalid."
  }
}

variable "network_name" {
  description = "The name of the network for which NAT gateway will be created"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.network_name))
    error_message = "VPC name is invalid."
  }
}

variable "countnum" {
  description = ""

}

variable "min_ports_per_vm" {
  description = ""
}

variable "icmp_idle_timeout_sec" {
  description = ""
}
variable "tcp_established_idle_timeout_sec" {
  description = ""
}
variable "tcp_transitory_idle_timeout_sec" {
  description = ""
}
variable "udp_idle_timeout_sec" {
  description = ""
}


