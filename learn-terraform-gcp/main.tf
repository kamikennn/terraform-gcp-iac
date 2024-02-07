terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("../auth/terraform-tutorial-413506-da105707ed3b.json")

  project = "terraform-tutorial-413506"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-b"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
