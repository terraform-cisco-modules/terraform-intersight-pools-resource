<!-- BEGIN_TF_DOCS -->
# Resource Pool Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

### main.tf
```hcl
module "resource_pool" {
  source  = "terraform-cisco-modules/pools-resource/intersight"
  version = ">= 1.0.2"

  assignment_order   = "sequential"
  description        = "default Resource Pool."
  name               = "default"
  organization       = "default"
  pool_type          = "Static"
  resource_type      = "Server"
  serial_number_list = ["FCH1234AABB", "FCH1234AACC"]
  server_type        = "Blades"
}

```

### provider.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
  required_version = ">=1.3.0"
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

### variables.tf
```hcl
variable "apikey" {
  description = "Intersight API Key."
  sensitive   = true
  type        = string
}

variable "endpoint" {
  default     = "https://intersight.com"
  description = "Intersight URL."
  type        = string
}

variable "secretkey" {
  description = "Intersight Secret Key."
  sensitive   = true
  type        = string
}
```
<!-- END_TF_DOCS -->