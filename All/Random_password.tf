/*Create random password for the virtual machine. */
resource "random_password" "password" {
  length           = 12
  special          = true
  #override_special = "_"
}