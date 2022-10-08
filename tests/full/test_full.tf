module "main" {
  source             = "../.."
  assignment_order   = "sequential"
  description        = "${var.name} Resource Pool."
  name               = var.name
  organization       = "terratest"
  pool_type          = "Static"
  resource_type      = "Server"
  serial_number_list = []
  server_type        = "Blades"
}
