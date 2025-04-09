### Issues

 Error: Provider returned invalid result object after apply

 resource "cloudflare_zero_trust_device_default_profile_local_domain_fallback" (access.tf)

 Return value has issues. Resource gets applied correctly
 
 Message:
 After the apply operation, the provider still indicated an unknown value for
 module.zerotrust.cloudflare_zero_trust_device_default_profile_local_domain_fallback.fallback_domain.suffix. All values must be known
 after apply, so this is always a bug in the provider and should be reported in the provider's own repository. OpenTofu will still
 save the other known object values in the state.