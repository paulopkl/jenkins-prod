output "ssh_key_location" {
  value = local_file.private_key.filename
}

output "instructions" {
  value = "Copy the content of that SSH Key and put in your Github repository"
}
