variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.project_id))
    error_message = "Project ID is invalid."
  }
}

variable "region" {
  description = "The Region to deploy all resources"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Region is invalid."
  }
}

variable "network_name" {
  description = "The VPC name to be created"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.network_name))
    error_message = "VPC name is invalid."
  }
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
  validation {
    condition = (
      var.routing_mode == "GLOBAL" ||
      var.routing_mode == "REGIONAL"
    )
    error_message = "Routing mode must be GLOBAL or REGIONAL."
  }
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
}


variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = "This VPC network will be used for Prod Project"
}

variable "mtu" {
  type        = number
  description = "The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically."
  default     = 0
}