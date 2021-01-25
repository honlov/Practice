variable "resourcename" {
  description = "This is Resource Group name"
}
variable "location" {
  description = "This is Location"
}
variable "tags" {
  type        = map
  description = "Tag value"
}
variable "storagename" {
  description = "Storage name"
}
variable "containername" {
  description = "Container name"
}
variable "dnsname" {
  type = list
}
variable "networkrule" {
}
variable "enviornment" {
}
variable "account_type" {
}
variable "address_space" {
}
variable "tag2" {
}
