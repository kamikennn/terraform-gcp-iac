# Build GCP instance by Terraform

## Environment

- MacBook Pro (13-inch, M1, 2020)
  - macOS Sonoma 14.3

## Install Terraform

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew update
brew upgrade hashicorp/tap/terraform
terraform -help
```

[Terraform Install manual](https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli)

## GCP Setup

1. Create a project (you can use the existing one as well)
2. Enable "Compute Engine API"
3. Create a service account key to enable Terraform to access the GCP account.
   - For the Role, choose "Project -> Editor", then click "Continue".

## Create Infrastructure

```bash
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_network.vpc_network will be created
  + resource "google_compute_network" "vpc_network" {
      + auto_create_subnetworks         = true
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + internal_ipv6_range             = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "terraform-network"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_network.vpc_network: Creating...
google_compute_network.vpc_network: Still creating... [10s elapsed]
google_compute_network.vpc_network: Still creating... [20s elapsed]
google_compute_network.vpc_network: Still creating... [30s elapsed]
google_compute_network.vpc_network: Still creating... [40s elapsed]
google_compute_network.vpc_network: Still creating... [50s elapsed]
google_compute_network.vpc_network: Creation complete after 54s [id=projects/terraform-tutorial-413506/global/networks/terraform-network]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## Destroy Infrastructure

```bash
$ terraform destroy
google_compute_network.vpc_network: Refreshing state... [id=projects/terraform-tutorial-413506/global/networks/terraform-network]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # google_compute_network.vpc_network will be destroyed
  - resource "google_compute_network" "vpc_network" {
      - auto_create_subnetworks         = true -> null
      - delete_default_routes_on_create = false -> null
      - enable_ula_internal_ipv6        = false -> null
      - id                              = "projects/terraform-tutorial-413506/global/networks/terraform-network" -> null
      - mtu                             = 0 -> null
      - name                            = "terraform-network" -> null
      - project                         = "terraform-tutorial-413506" -> null
      - routing_mode                    = "REGIONAL" -> null
      - self_link                       = "https://www.googleapis.com/compute/v1/projects/terraform-tutorial-413506/global/networks/terraform-network" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

google_compute_network.vpc_network: Destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network]
google_compute_network.vpc_network: Still destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network, 10s elapsed]
google_compute_network.vpc_network: Still destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network, 20s elapsed]
google_compute_network.vpc_network: Still destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network, 30s elapsed]
google_compute_network.vpc_network: Still destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network, 40s elapsed]
google_compute_network.vpc_network: Still destroying... [id=projects/terraform-tutorial-413506/global/networks/terraform-network, 50s elapsed]
google_compute_network.vpc_network: Destruction complete after 53s

Destroy complete! Resources: 1 destroyed.
```
