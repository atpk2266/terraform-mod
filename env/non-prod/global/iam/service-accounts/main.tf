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


module "service_accounts" {
  source       = "../../../../../modules/iam/service_accounts"
  project_id   = var.project_id
  prefix       = var.prefix
  names        = ["gke-app-sa"]
  display_name = var.display_name
  description  = var.description
  project_roles = [
    "${var.project_id}=>roles/container.admin",
    "${var.project_id}=>roles/storage.admin",
    "${var.project_id}=>roles/firestore.serviceAgent",
    "${var.project_id}=>roles/pubsub.admin"
  ]
}

