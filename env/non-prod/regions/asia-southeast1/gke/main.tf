data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke_private_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke_private_cluster.ca_certificate)
}

module "gke_private_cluster" {
  source                     = "../../../../../modules/gke/gke_private_cluster"
  project_id                 = var.project_id
  name                       = var.cluster_name
  regional                   = true
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = true
  create_service_account     = false
  network_policy             = false
  enable_private_endpoint    = true
  enable_private_nodes       = true
  enable_shielded_nodes      = true
  remove_default_node_pool   = true
  horizontal_pod_autoscaling = true
  #  kubernetes_dashboard       = true
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  kubernetes_version         = var.kubernetes_version
  master_authorized_networks = var.master_authorized_networks
  cluster_resource_labels    = var.gce_labels

  node_pools = [
    {
      name               = var.node_pool_01
      machine_type       = var.machine_type_01
      node_locations     = ""
      min_count          = var.min_count_01
      max_count          = var.max_count_01
      local_ssd_count    = 0
      disk_size_gb       = var.disk_size_gb_01
      disk_type          = var.disk_type_01
      image_type         = var.image_type_01
      auto_repair        = var.auto_repair_01
      auto_upgrade       = var.auto_upgrade_01
      service_account    = var.service_account
      preemptible        = var.preemptible_01
      initial_node_count = 1
    },
    {
      name               = var.node_pool_02
      machine_type       = var.machine_type_02
      node_locations     = ""
      min_count          = var.min_count_02
      max_count          = var.max_count_02
      local_ssd_count    = 0
      disk_size_gb       = var.disk_size_gb_02
      disk_type          = var.disk_type_02
      image_type         = var.image_type_02
      auto_repair        = var.auto_repair_02
      auto_upgrade       = var.auto_upgrade_02
      service_account    = var.service_account
      preemptible        = true
      initial_node_count = 1
    }
  ]
}
