resource "google_compute_backend_service" "this" {
  name                  = "backend-service"
  health_checks         = [google_compute_http_health_check.this.self_link]
  load_balancing_scheme = var.load_balancing_scheme
}

resource "google_compute_http_health_check" "this" {
  name               = "health-check"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}

resource "google_compute_global_forwarding_rule" "this" {
  name       = "global-rule"
  target     = google_compute_target_http_proxy.this.self_link
  port_range = "80"
}

resource "google_compute_target_http_proxy" "this" {
  name        = "target-proxy"
  description = "a description"
  url_map     = google_compute_url_map.this.self_link
}

resource "google_compute_url_map" "this" {
  name         = "url-map-target-proxy"
  description  = "a description"
  this_service = google_compute_backend_service.this.self_link

  host_rule {
    hosts        = ["mysite.com"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name         = "allpaths"
    this_service = google_compute_backend_service.this.self_link

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_service.this.self_link
    }
  }
}
