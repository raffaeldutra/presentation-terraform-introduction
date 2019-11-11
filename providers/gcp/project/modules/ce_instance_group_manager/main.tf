resource "google_compute_instance_group_manager" "this" {
  name = "this-igm"

  base_instance_name = "app"
  zone               = var.zone

  version {
    instance_template  = var.instance_template
  }

//   target_pools = var.target_pools
  target_size  = var.target_size

  named_port {
    name = lower("customHTTP")
    port = 8888
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.self_link
    initial_delay_sec = 300
  }
}