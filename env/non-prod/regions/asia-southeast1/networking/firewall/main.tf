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


/* Firewall Rule for iap Access */
module "google_iap_access_fw_rule" {
  source       = "../../../../../../modules/networking/firewall"
  network_name = var.network_name
  project_id   = var.project_id
  rules = [{
    name                    = "allow-iap-access-fw"
    description             = "Allow iap Access"
    ranges            = ["35.235.240.0/20"]
    priority                  = "1000"
    direction                 = "INGRESS"
    source_tags             = null
    source_service_accounts = null
    target_tags = ["allow-iap-access"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22", "3389"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}

/* Firewall Rule for Web Access */
module "allow_web" {
  source       = "../../../../../../modules/networking/firewall"
  network_name = var.network_name
  project_id   = var.project_id
  rules = [{
    name                    = "allow-web-frw"
    description             = "Allow HTTP and HTTPS Access"
    direction               = "INGRESS"
    ranges                  = ["0.0.0.0/0"]
    priority                = 1000
    source_tags             = null
    source_service_accounts = null
    target_tags             = ["web"]
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}
