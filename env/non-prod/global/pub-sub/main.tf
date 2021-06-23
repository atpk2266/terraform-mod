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


module "pubsub1" {
  source       = "../../../../modules/pub-sub/google_pubsub"
  project_id   = var.project_id
  topic        = var.topic_name1
  topic_labels = var.topic_labels1
#  create_topic = true
  /*
  push_subscriptions = [
    {
      name                       = "push"                                               // required
      ack_deadline_seconds       = 20                                                   // optional
      push_endpoint              = "https://example.com"                                // required
      x-goog-version             = "v1beta1"                                            // optional
      oidc_service_account_email = "sa@example.com"                                     // optional
      audience                   = "example"                                            // optional
      expiration_policy          = "1209600s"                                           // optional
      dead_letter_topic          = "projects/my-pubsub-project/topics/example-dl-topic" // optional
      max_delivery_attempts      = 5                                                    // optional
      maximum_backoff            = "600s"                                               // optional
      minimum_backoff            = "300s"                                               // optional
      filter                     = "attributes.domain = \"com\""                        // optional
      enable_message_ordering    = true                                                 // optional
    }
  ]
  */
  pull_subscriptions = [
    {
      name                  = "roposocdn-sandbox-newfile-subscriber1"
      ack_deadline_seconds  = 20
#      dead_letter_topic     = "projects/${var.project_id}/topics/test-topic"
      max_delivery_attempts = 3
      maximum_backoff       = "600s"
      minimum_backoff       = "300s"
      #      filter                  = "attributes.domain = \"com\""                        
      enable_message_ordering = true
      service_account         = "roposocdn-sandbox-gke-app-sa@roposocdn-sandbox-7980.gserviceaccount.com"
    },
    {
      name                  = "roposocdn-sandbox-newfile-subscriber2"
      ack_deadline_seconds  = 20
#      dead_letter_topic     = "projects/${var.project_id}/topics/test-topic"
      max_delivery_attempts = 3
      maximum_backoff       = "600s"
      minimum_backoff       = "300s"
      #      filter                  = "attributes.domain = \"com\""                        
      enable_message_ordering = true
      service_account         = "roposocdn-sandbox-gke-app-sa@roposocdn-sandbox-7980.iam.gserviceaccount.com"
    },
  ]
}



module "pubsub2" {
  source       = "../../../../modules/pub-sub/google_pubsub"
  project_id   = var.project_id
  topic        = var.topic_name2
  topic_labels = var.topic_labels2
#  create_topic = true
  /*
  push_subscriptions = [
    {
      name                       = "push"                                               // required
      ack_deadline_seconds       = 20                                                   // optional
      push_endpoint              = "https://example.com"                                // required
      x-goog-version             = "v1beta1"                                            // optional
      oidc_service_account_email = "sa@example.com"                                     // optional
      audience                   = "example"                                            // optional
      expiration_policy          = "1209600s"                                           // optional
      dead_letter_topic          = "projects/my-pubsub-project/topics/example-dl-topic" // optional
      max_delivery_attempts      = 5                                                    // optional
      maximum_backoff            = "600s"                                               // optional
      minimum_backoff            = "300s"                                               // optional
      filter                     = "attributes.domain = \"com\""                        // optional
      enable_message_ordering    = true                                                 // optional
    }
  ]
  */
  pull_subscriptions = [
    {
      name                  = "roposocdn-sandbox-newthumbnail-subscriber"
      ack_deadline_seconds  = 20
#      dead_letter_topic     = "projects/${var.project_id}/topics/test-topic"
      max_delivery_attempts = 3
      maximum_backoff       = "600s"
      minimum_backoff       = "300s"
      #      filter                  = "attributes.domain = \"com\""                        
      enable_message_ordering = true
      service_account         = "roposocdn-sandbox-gke-app-sa@roposocdn-sandbox-7980.iam.gserviceaccount.com"
    }
  ]
}
