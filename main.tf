resource "oci_network_firewall_network_firewall_policy_decryption_profile" "network_firewall_network_firewall_policy_decryption_profiles" {
  for_each = var.network_firewall_network_firewall_policy_decryption_profiles

  name                                  = each.value.name
  network_firewall_policy_id            = each.value.network_firewall_policy_id
  type                                  = each.value.type
  are_certificate_extensions_restricted = each.value.are_certificate_extensions_restricted
  description                           = each.value.description
  is_auto_include_alt_name              = each.value.is_auto_include_alt_name
  is_expired_certificate_blocked        = each.value.is_expired_certificate_blocked
  is_out_of_capacity_blocked            = each.value.is_out_of_capacity_blocked
  is_revocation_status_timeout_blocked  = each.value.is_revocation_status_timeout_blocked
  is_unknown_revocation_status_blocked  = each.value.is_unknown_revocation_status_blocked
  is_unsupported_cipher_blocked         = each.value.is_unsupported_cipher_blocked
  is_unsupported_version_blocked        = each.value.is_unsupported_version_blocked
  is_untrusted_issuer_blocked           = each.value.is_untrusted_issuer_blocked

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

