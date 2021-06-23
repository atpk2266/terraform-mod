## Cluster Variables ##
variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Cluster name is invalid."
  }
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster (required)"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.cluster_name))
    error_message = "Cluster name is invalid."
  }
}

variable "description" {
  type        = string
  description = "The description of the cluster"
  default     = ""
}

variable "zones" {
  type        = list(string)
  description = "The zone to host the cluster in (required if is a zonal cluster)"
}

variable "network" {
  description = "The VPC network to host the cluster in"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster in"
  type        = string
}

variable "ip_range_pods" {
  description = "The secondary ip range to use for pods"
}

variable "ip_range_services" {
  description = "The secondary ip range to use for services"
}

variable "service_account" {
  description = "Service account to associate to the nodes in the cluster"
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "(Beta) The IP range in CIDR notation to use for the hosted master network"
  default     = "10.0.0.0/28"
  validation {
    condition = (
      can(regex("((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.)){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)/([0-9]|1[0-9]|2[0-9]|3[0-2])$", var.master_ipv4_cidr_block)) ||
      var.master_ipv4_cidr_block == ""
    )
    error_message = "IPv4 CIDR range is invalid."
  }
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default     = []
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  default     = "latest"
}

## Node 1 Variables ##

variable "node_pool_01" {
  type        = string
  description = "The name of the node pool (required)"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.node_pool_01))
    error_message = "Node pool name is invalid."
  }
}


variable "auto_repair" {
  type    = bool
  default = true
}

variable "auto_upgrade" {
  type    = bool
  default = true
}

variable "min_count" {
  description = "Minimum number of nodes in the NodePool."
  default     = 1
}

variable "max_count" {
  description = "Maximum number of nodes in the NodePool."
  default     = 3
}

variable "machine_type" {
  description = "The name of a Google Compute Engine machine type"
  default     = "n1-standard-2"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.machine_type))
    error_message = "Machine type is invalid."
  }
}


variable "image_type" {
  description = "The image type to use for this node."
  default     = "COS"
  validation {
    condition     = var.image_type == "COS"
    error_message = "COS image is recommended."
  }
}

variable "disk_type" {
  description = "Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd')"
  default     = "pd-standard"
}

variable "disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB"
  default     = "100"
}

variable "preemptible" {
  type        = bool
  description = "A boolean that represents whether or not the underlying node VMs are preemptible"
  default     = false
}

variable "gce_labels" {
  default = ""
}

## Node 2 Variables ##

variable "node_pool_02" {
  type        = string
  description = "The name of the node pool (required)"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.node_pool_02))
    error_message = "Node pool name is invalid."
  }
}