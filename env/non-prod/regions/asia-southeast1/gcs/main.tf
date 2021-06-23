/******************************************
	GCS Bucket configuration for Terraform State management
 *****************************************/
module "gcs_bucket" {
  source     = "../../../../../modules/gcs"
  prefix     = var.prefix
  project_id = var.project_id
  location   = var.location
  names      = var.bucket_names
}




