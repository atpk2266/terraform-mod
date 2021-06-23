terraform {
  backend "gcs" {
    bucket = "roposocdn-sandbox-terraform-gcs"
    prefix = "terraform/tfstate/firewall_rule"
  }
}