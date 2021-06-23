/* GLOBAL */
project_id = "roposocdn-sandbox-7980"
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
disk_size_gb    = 30
disk_type       = "pd-standard"
image_type      = "COS"
machine_type    = "g1-small"
service_account = "roposocdn-sandbox-gke-app-sa@searce-playground.iam.gserviceaccount.com"

/* Node Pool 2 Configuration */
node_pool_02 = "gkepvmnodepool-02"
