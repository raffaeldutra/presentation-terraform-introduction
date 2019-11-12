resource "google_compute_instance_group_manager" "this" {
  name = format("%s-igm", var.name)

  base_instance_name = format("%s", var.name)
  zone               = var.zone

  version {
    instance_template  = var.instance_template
  }

  // target_pools = [var.instance_template]
  target_size  = var.target_size

  named_port {
    name = lower("customHTTP")
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.this.self_link
    initial_delay_sec = 300
  }

  update_policy{
    type = "PROACTIVE"
    minimal_action = "REPLACE"
    max_surge_percent = 20
    max_unavailable_fixed = 2
    min_ready_sec = 50
  }
}

resource "google_compute_health_check" "this" {
  name                = format("%s-hc", var.name)
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10 # 50 seconds

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}