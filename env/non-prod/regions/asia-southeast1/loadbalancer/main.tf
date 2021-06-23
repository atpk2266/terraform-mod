/**
 * Copyright 2017 Google LLC
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


locals {
  health_check = {
    check_interval_sec  = 10
    timeout_sec         = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
    request_path        = "/"
    port                = 80
    host                = null
    logging             = false
  }
}


/* Managed SSL Creation */
resource "google_compute_managed_ssl_certificate" "my_ssl" {
  name = "test-cert"
  managed {
    domains = ["goinit.net."]
  }
}

module "gcs-lb" {
  source               = "../../../../../modules/loadbalancer/http_loadbalancer"
  name                 = "${var.name}-cdn"
  project              = var.project_id
  cdn                  = true
  firewall_networks    = ["${var.network_name}"]
  create_address       = true
  ssl                  = true
  ssl_certificates     = google_compute_managed_ssl_certificate.my_ssl.*.self_link
  create_url_map       = false
  url_map              = google_compute_url_map.urlmap.self_link
  http_forward         = true
  https_redirect       = false
  use_ssl_certificates = true

  backends = {
    default = {
      description            = null
      protocol               = "HTTPS"
      port                   = 443
      port_name              = "https"
      timeout_sec            = 10
      enable_cdn             = false
      custom_request_headers = null
      security_policy        = null

      connection_draining_timeout_sec = null
      session_affinity                = null
      affinity_cookie_ttl_sec         = null

      health_check = local.health_check

      log_config = {
        enable      = false
        sample_rate = 0.0
      }

      groups = []

      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}

/* URL Mapping */

resource "google_compute_url_map" "urlmap" {
  project = var.project_id

  name        = "${var.name}-cdn-lb"
  description = "URL map for ${var.name}"

  default_service = google_compute_backend_bucket.content.self_link

}


/* Backend Bucket with Content */

resource "google_storage_bucket" "my-bucket" {
  name          = "roposocdn-sandbox-furnishvideos-gcs"
  location      = "asia-southeast1"
  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_backend_bucket" "content" {
  name        = "roposo-backend-bucket"
  description = "Contains static resources for roposo app"
  bucket_name = google_storage_bucket.my-bucket.name
  enable_cdn  = true
}


