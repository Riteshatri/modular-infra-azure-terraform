variable "network_security_group_name" {

}

variable "resource_group_name" {

}

variable "allowed_ports" {
  type    = list(number)
  default = [22]  # default is SSH
}