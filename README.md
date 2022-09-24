<!-- BEGIN_TF_DOCS -->
# Terraform Intersight Pools - Resource
Manages Intersight Resource Pools

Location in GUI:
`Pools` » `Create Pool` » `Resource`

## Example

### main.tf
```hcl
module "resource_pool" {
  source  = "terraform-cisco-modules/pools-resource/intersight"
  version = ">= 1.0.2"

  assignment_order   = "sequential"
  description        = "Demo Resource Pool"
  name               = "default"
  organization       = "default"
  pool_type          = "Static"
  resource_type      = "Server"
  serial_number_list = ["FCH1234AABB", "FCH1234AACC"]
  server_type        = "Blades"
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

### versions.tf
```hcl
terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

provider "intersight" {
  apikey    = var.apikey
  endpoint  = var.endpoint
  secretkey = var.secretkey
}
```

## Environment Variables

### Terraform Cloud/Enterprise - Workspace Variables
- Add variable apikey with value of [your-api-key]
- Add variable secretkey with value of [your-secret-file-content]

### Linux
```bash
export TF_VAR_apikey="<your-api-key>"
export TF_VAR_secretkey=`cat <secret-key-file-location>`
```

### Windows
```bash
$env:TF_VAR_apikey="<your-api-key>"
$env:TF_VAR_secretkey="<secret-key-file-location>""
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >=1.0.32 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.32 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apikey"></a> [apikey](#input\_apikey) | Intersight API Key. | `string` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | Intersight URL. | `string` | `"https://intersight.com"` | no |
| <a name="input_secretkey"></a> [secretkey](#input\_secretkey) | Intersight Secret Key. | `string` | n/a | yes |
| <a name="input_assignment_order"></a> [assignment\_order](#input\_assignment\_order) | Assignment order decides the order in which the next identifier is allocated.<br>  * sequential - Identifiers are assigned in a sequential order.<br>  * default - Assignment order is decided by the system. | `string` | `"default"` | no |
| <a name="input_description"></a> [description](#input\_description) | Description for the MAC Address Pool. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the MAC Pool. | `string` | `"default"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/. | `string` | `"default"` | no |
| <a name="input_pool_type"></a> [pool\_type](#input\_pool\_type) | The resource management type in the pool, it can be either static or dynamic.<br>  * Dynamic - The resources in the pool will be updated dynamically based on the condition.<br>  * Static - The resources in the pool will not be changed until user manually update it. | `string` | `"Static"` | no |
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | The type of the resource present in the pool, example 'server' its combination of RackUnit and Blade.<br>  * None - The resource cannot consider for Resource Pool.<br>  * Server - Resource Pool holds the server kind of resources, example - RackServer, Blade. | `string` | `"Server"` | no |
| <a name="input_serial_number_list"></a> [serial\_number\_list](#input\_serial\_number\_list) | A List of Compute Server Serial Numbers. | `set(string)` | n/a | yes |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The type of the resource present in the pool.<br>  * Blades - A Blade Server.  B-Series and X-Series.<br>  * RackUnits - A Rackmount Server. | `string` | `"Blades"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of Tag Attributes to Assign to the Policy. | `list(map(string))` | `[]` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_moid"></a> [moid](#output\_moid) | Resource Pool Managed Object ID (moid). |
## Resources

| Name | Type |
|------|------|
| [intersight_resourcepool_pool.resource](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/resourcepool_pool) | resource |
| [intersight_compute_physical_summary.servers](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/compute_physical_summary) | data source |
| [intersight_organization_organization.org_moid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
<!-- END_TF_DOCS -->