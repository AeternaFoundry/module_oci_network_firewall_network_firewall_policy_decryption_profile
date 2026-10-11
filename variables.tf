variable "network_firewall_network_firewall_policy_decryption_profiles" {
  description = <<EOT
Map of network_firewall_network_firewall_policy_decryption_profiles, attributes below
Required:
    - name
    - network_firewall_policy_id
    - type
Optional:
    - are_certificate_extensions_restricted
    - description
    - is_auto_include_alt_name
    - is_expired_certificate_blocked
    - is_out_of_capacity_blocked
    - is_revocation_status_timeout_blocked
    - is_unknown_revocation_status_blocked
    - is_unsupported_cipher_blocked
    - is_unsupported_version_blocked
    - is_untrusted_issuer_blocked
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                                  = string
    network_firewall_policy_id            = string
    type                                  = string
    are_certificate_extensions_restricted = optional(bool)
    description                           = optional(string)
    is_auto_include_alt_name              = optional(bool)
    is_expired_certificate_blocked        = optional(bool)
    is_out_of_capacity_blocked            = optional(bool)
    is_revocation_status_timeout_blocked  = optional(bool)
    is_unknown_revocation_status_blocked  = optional(bool)
    is_unsupported_cipher_blocked         = optional(bool)
    is_unsupported_version_blocked        = optional(bool)
    is_untrusted_issuer_blocked           = optional(bool)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.network_firewall_network_firewall_policy_decryption_profiles : (
        contains([for v in ["SSL_FORWARD_PROXY", "SSL_INBOUND_INSPECTION"] : lower(v)], lower(v.type))
      )
    ])
    error_message = "must be one of: \"SSL_FORWARD_PROXY\", \"SSL_INBOUND_INSPECTION\""
  }
}

