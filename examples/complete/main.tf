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

