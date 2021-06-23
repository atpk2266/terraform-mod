terraform {
  backend "gcs" {
    bucket = "roposocdn-sandbox-terraform-gcs"
    prefix = "terraform/tfstate/cloud_pubsub"
  }
}