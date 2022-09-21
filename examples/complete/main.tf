module "resource_pool" {
  source  = "scotttyso/pools-resource/intersight"
  version = ">= 1.0.1"

  assignment_order   = "sequential"
  description        = "Demo Resource Pool"
  name               = "default"
  organization       = "default"
  pool_type          = "Static"
  resource_type      = "Server"
  serial_number_list = ["FCH1234AABB", "FCH1234AACC"]
  server_type        = "Blades"
}

