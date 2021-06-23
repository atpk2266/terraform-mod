/* GLOBAL */
project_id = "roposocdn-sandbox-7980"
region     = "asia-southeast1"


/* VPC */
network_name            = "roposocdn-sandbox-main-vpc"
description             = "Roposocdn VPC"
routing_mode            = "REGIONAL"
auto_create_subnetworks = "false"
mtu                     = 1500


/* Subnets */
subnets = [
  {
    subnet_name           = "roposocdn-sandbox-seasia-subnet-01"
    subnet_ip             = "10.242.160.0/24"
    subnet_region         = "asia-southeast1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]

secondary_ranges = {
  roposocdn-sandbox-seasia-subnet-01 = [
    {
      range_name    = "roposo-pods-ip-range"
      ip_cidr_range = "10.242.176.0/20"
    },
    {
      range_name    = "roposo-service-ip-range"
      ip_cidr_range = "10.242.161.0/24"
    },
  ]
}