output "vm_public_ips" {
  value = module.public_ip.public_ip_addresses
}

output "vm_admin_usernames" {
  value = module.virtual_machine.admin_usernames
}