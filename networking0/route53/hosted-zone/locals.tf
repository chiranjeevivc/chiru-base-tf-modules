# -------------------------------------------------------------------------------------------------
# Booleans to determine which resource "type" to build
# -------------------------------------------------------------------------------------------------

locals {

  is_name_delegated = "${var.delegation_set_name != "" && var.delegation_set_id == "" && var.private_zone == 0 ? true : false}"
  is_id_delegated   = "${var.delegation_set_name == "" && var.delegation_set_id != "" && var.private_zone == 0 ? true : false}"
  is_undelegated    = "${var.delegation_set_name == "" && var.delegation_set_id == "" && var.private_zone == 0 ? true : false}"
  is_custom_ns      = "${length(var.custom_subdomain_ns) != 0 && var.private_zone == 0 ? true : false}"
  is_private_zone   = "${var.private_zone == 0 ? true : false}"
}

# -------------------------------------------------------------------------------------------------
# Split Domains from Subdomains in hosted zones
# -------------------------------------------------------------------------------------------------

locals {
  # The following will split out domains and subdomains from public hosted zones as both require
  # different configuration. Subdomains will also need NS server to be specified.
  #
  # Compact will remove any empty elements (previously included either domains or subdomains)
  # flatten will convert [map('key' => val),..] into flat list without 'key'
  public_domains = "${compact(flatten(null_resource.public_domains.*.triggers.key))}"

  public_subdomains = "${compact(flatten(null_resource.public_subdomains.*.triggers.key))}"
}

resource "null_resource" "public_domains" {
  count = "${length(var.public_hosted_zones)}"

  triggers = "${map("key",
    replace(
      var.public_hosted_zones[count.index],
      "/^[-_A-Za-z0-9]+\\.[A-Za-z0-9]+$/",
      ""
    ) == "" ? var.public_hosted_zones[count.index] : ""
  )}"
}

resource "null_resource" "public_subdomains" {
  count = "${length(var.public_hosted_zones)}"

  triggers = "${map("key",
    replace(
      var.public_hosted_zones[count.index],
      "/^[-_A-Za-z0-9]+\\.[A-Za-z0-9]+$/",
      ""
    ) == "" ? "" : var.public_hosted_zones[count.index]
  )}"
}
