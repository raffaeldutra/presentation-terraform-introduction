// Frontend
resource "google_compute_global_forwarding_rule" "this" {
  name       = format("%s-fe", var.name)
  target     = google_compute_target_http_proxy.this.self_link
  port_range = "80"
  load_balancing_scheme = var.load_balancing_scheme

  depends_on = [google_compute_target_http_proxy.this]
}

resource "google_compute_target_http_proxy" "this" {
  name        = format("%s-tp", var.name)
  description = format("%s Load Balancer", var.name)
  url_map     = google_compute_url_map.this.self_link
}

// Load Balancer
resource "google_compute_url_map" "this" {
  name            = format("%s-lb", var.name)
  description     = format("%s Load Balancer", var.name)
  default_service = google_compute_backend_service.this.self_link
}

// Backend
resource "google_compute_backend_service" "this" {
  name                  = format("%s-lb", var.name)
  health_checks         = [google_compute_http_health_check.this.self_link]
  load_balancing_scheme = var.load_balancing_scheme
  port_name             = "http"
  protocol              = "HTTP"
  timeout_sec           = 10
  session_affinity      = "NONE"

  backend {
    group = var.group
    balancing_mode = "RATE"
    max_rate_per_instance = 2
  }
}

resource "google_compute_http_health_check" "this" {
  name               = format("%s-hc", var.name)
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}