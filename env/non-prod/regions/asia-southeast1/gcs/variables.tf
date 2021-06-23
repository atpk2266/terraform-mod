variable "project_id" {
  type        = string
  description = "GCP Project ID where the bucket will be created"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.project_id))
    error_message = "Project ID is invalid."
  }
}

variable "region" {
  type        = string
  description = "GCP region where the bucket will be created"
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Region is invalid."
  }
}

variable "prefix" {
  description = "Prefix used to generate the bucket name."
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.prefix))
    error_message = "Region is invalid."
  }
}

variable "bucket_names" {
  type        = list(string)
  description = "GCS Bucket names"
}

variable "location" {
  description = "Bucket location."
  type        = string
  default     = "ASIA"
}