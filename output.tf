output "dns" {
    value = {
        dns = data.cloudflare_dns_records.dns_records.result
#        zero_trust_groups = data.cloudflare_zero_trust_access_groups.groups.result
    }
}