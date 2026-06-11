# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "secret-manager" {
  source      = "../../"
  key_ring_id = google_kms_key_ring.secret.id
  secrets = [
    {
      name        = "pike"
      secret_data = "permissions"
    },
  ]
  rotation_period    = "7776000s"
  next_rotation_time = "2026-09-08T00:00:00Z"
  topics = [
    google_pubsub_topic.secret.id
  ]
}
