/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.project_id))
    error_message = "Project ID is invalid."
  }
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.network_name))
    error_message = "VPC name is invalid."
  }
}

variable "region" {
  description = "GCP region where the resource will be created"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Region is invalid."
  }
}


variable "name" {
  description = "Name of resources"
  type        = string
}

variable "check_timeout_sec" {
  description = ""
  
}
variable "check_interval_sec" {
  description = ""
  
}
variable "healthy_threshold" {
  description = ""
  
}
variable "unhealthy_threshold" {
  description = ""
  
}
variable "portnum" {
  description = ""
  
}