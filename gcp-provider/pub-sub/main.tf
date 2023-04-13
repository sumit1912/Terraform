resource "google_pubsub_topic" "topic_tf" {
  name = "topic_tf"

}

resource "google_pubsub_subscription" "subs_tf" {
  name = "subs_tf"
  topic = google_pubsub_topic.topic_tf.name
}