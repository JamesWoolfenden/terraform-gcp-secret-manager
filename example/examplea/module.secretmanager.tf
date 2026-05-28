# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "secret-manager" {
  source      = "../../"
  key_ring_id = google_kms_key_ring.key_ring.id
  secrets = [
    {
      name        = "pike"
      secret_data = "permissions"
    },
  ]
  rotation_period = "7776000s"
  topics = [
    google_pubsub_topic.secret.id
  ]
}
