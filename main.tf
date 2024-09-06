resource "google_monitoring_dashboard" "dashboard" {
  project = "${var.project_id}"
  dashboard_json = file("${path.module}/dash.json")

}
