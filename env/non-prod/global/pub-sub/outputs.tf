/**
 * Copyright 2018 Google LLC
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

output "project_id" {
  value       = var.project_id
  description = "The project ID"
}

/* Topic 1 */
output "topic_name1" {
  value       = module.pubsub1.topic
  description = "The name of the Pub/Sub topic created"
}

output "subscription_name1" {
  value       = module.pubsub1.subscription_names
  description = "The name of the Pub/Sub topic created"
}

output "topic_labels1" {
  value       = module.pubsub1.topic_labels
  description = "The labels of the Pub/Sub topic created"
}

/* Topic 2 */
output "topic_name2" {
  value       = module.pubsub2.topic
  description = "The name of the Pub/Sub topic created"
}

output "subscription_name2" {
  value       = module.pubsub2.subscription_names
  description = "The name of the Pub/Sub topic created"
}

output "topic_labels3" {
  value       = module.pubsub2.topic_labels
  description = "The labels of the Pub/Sub topic created"
}