terraform {
  backend "gcs" {
    bucket = "roposocdn-sandbox-terraform-gcs"
    prefix = "terraform/networking/vpc_subnets"
  }
}
