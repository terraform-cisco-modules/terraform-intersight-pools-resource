#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Server Moid Data Source
# GUI Location:
#   Operate > Servers > Copy the Serial from the Column.
#____________________________________________________________

data "intersight_compute_physical_summary" "servers" {
  for_each = {
    for v in var.serial_number_list : v => v
  }
  serial = each.value
}

#____________________________________________________________
#
# Intersight Resource Pool Resource
# GUI Location: Pools > Create Pool > Resource Pool
#____________________________________________________________

resource "intersight_resourcepool_pool" "resource_pool" {
  assignment_order = var.assignment_order
  description      = var.description != "" ? var.description : "${var.name} Resource Pool."
  name             = var.name
  pool_type        = var.pool_type
  resource_pool_parameters = [
    {
      additional_properties = jsonencode(
        {
          ManagementMode = "Intersight"
        }
      )
      class_id    = "resourcepool.ServerPoolParameters"
      object_type = "resourcepool.ServerPoolParameters"
    }
  ]
  resource_type = var.resource_type
  selectors = [
    {
      additional_properties = ""
      class_id              = "resource.Selector"
      object_type           = "resource.Selector"
      selector = "/api/v1/compute/${var.server_type}?$filter=(Moid in (${format(
        "'%s'", join("','", [
          for s in var.serial_number_list : data.intersight_compute_physical_summary.servers[
          "${s}"].results[0].moid
      ]))})) and (ManagementMode eq 'Intersight')"
    }
  ]
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
