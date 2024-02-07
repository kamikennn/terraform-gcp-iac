terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file( var.credentials_file )
  project = var.project
  region  = var.region
  zone    = var.zone
}


resource "google_service_account" "service_account" {
  project = var.project
  account_id   = "bigquery-job-executor"
  display_name = "Service account for executing Bigquery Jobs from outside"
}
