/* GLOBAL */
project_id = "my-project-957-311307"
region     = "asia-southeast1"
zones      = ["asia-southeast1-a", "asia-southeast1-b"]
/* Network part*/

network           = "roposocdn-sandbox-main-vpc"
subnetwork        = "roposocdn-sandbox-seasia-subnet-01"
ip_range_pods     = "roposo-pods-ip-range"
ip_range_services = "roposo-service-ip-range"


/* Cluster Configuration */

cluster_name           = "roposocdn-sandbox-main-gke"
master_ipv4_cidr_block = "10.242.162.0/28"
kubernetes_version     = "1.19.9-gke.1900"
master_authorized_networks = [
  {
    cidr_block   = "10.242.0.0/16"
    display_name = "VPC"
  }
]
gce_labels = { "env" = "sandbox" }

/* Node Pool 1 Configuration */

node_pool_01    = "gkestdnodepool-01"
machine_type_01 = "g1-small"
disk_size_gb_01    = 30
disk_type_01       = "pd-standard"
image_type_01      = "COS"

service_account = "roposocdn-sandbox-gke-app-sa@searce-playground.iam.gserviceaccount.com"
min_count_01 = "1"
max_count_01 = "2"
auto_repair_01 = "true"
auto_upgrade_01 = "true"
/* Node Pool 2 Configuration */
node_pool_02 = "gkepvmnodepool-02"
machine_type_02 = "g1-small"
disk_size_gb_02    = 30
disk_type_02       = "pd-standard"
image_type_02      = "COS"


min_count_02 = "1"
max_count_02 = "2"
auto_repair_02 = "true"
auto_upgrade_02 = "true"