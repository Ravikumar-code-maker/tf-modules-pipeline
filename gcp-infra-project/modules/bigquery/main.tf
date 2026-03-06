resource "google_bigquery_dataset" "dataset" {
  dataset_id   = "${var.env_name}_dataset"
  project      = var.project_id
  location     = var.location
}

resource "google_bigquery_table" "table" {
  for_each = toset(var.tables)

  table_id = each.key
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  project    = var.project_id

  schema = jsonencode ([
    {
     name = "id",
     type = "STRING",
     mode = "REQUIRED"
    },
    {
     name = "value",
     type = "STRING",
     mode = "NULLABLE"
    }
  ])
}


