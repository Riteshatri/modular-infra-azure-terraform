variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "resource_group_location" {
  type        = string
  description = "Location for the Resource Group"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "virtual_network_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
}

variable "frontend_subnet_name" {
  type        = string
  description = "Name of the frontend subnet"
}

variable "frontend_subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for frontend subnet"
}

variable "backend_subnet_name" {
  type        = string
  description = "Name of the backend subnet"
}

variable "backend_subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for backend subnet"
}

variable "frontend_public_ip_name" {
  type        = string
  description = "Name of the frontend Public IP"
}

variable "backend_public_ip_name" {
  type        = string
  description = "Name of the backend Public IP"
}

variable "frontend_nsg_name" {
  type        = string
  description = "Frontend Network Security Group name"
}

variable "frontend_nsg_allowed_ports" {
  type        = list(number)
  description = "Allowed ports for frontend NSG"
}

variable "backend_nsg_name" {
  type        = string
  description = "Backend Network Security Group name"
}

variable "backend_nsg_allowed_ports" {
  type        = list(number)
  description = "Allowed ports for backend NSG"
}

variable "frontend_nic_name" {
  type        = string
  description = "Frontend NIC name"
}

variable "frontend_nic_ip_config_name" {
  type        = string
  description = "IP Configuration name for frontend NIC"
}

variable "backend_nic_name" {
  type        = string
  description = "Backend NIC name"
}

variable "backend_nic_ip_config_name" {
  type        = string
  description = "IP Configuration name for backend NIC"
}

variable "frontend_vm_name" {
  type        = string
  description = "Frontend VM name"
}

variable "frontend_vm_size" {
  type        = string
  description = "Frontend VM size"
}

variable "frontend_vm_publisher" {
  type        = string
  description = "Frontend VM image publisher"
}

variable "frontend_vm_offer" {
  type        = string
  description = "Frontend VM offer"
}

variable "frontend_vm_sku" {
  type        = string
  description = "Frontend VM SKU"
}

variable "frontend_vm_version" {
  type        = string
  description = "Frontend VM version"
}

variable "backend_vm_name" {
  type        = string
  description = "Backend VM name"
}

variable "backend_vm_size" {
  type        = string
  description = "Backend VM size"
}

variable "backend_vm_publisher" {
  type        = string
  description = "Backend VM image publisher"
}

variable "backend_vm_offer" {
  type        = string
  description = "Backend VM offer"
}

variable "backend_vm_sku" {
  type        = string
  description = "Backend VM SKU"
}

variable "backend_vm_version" {
  type        = string
  description = "Backend VM version"
}

variable "sql_server_name" {
  type        = string
  description = "SQL Server name"
}

variable "sql_database_name" {
  type        = string
  description = "SQL Database name"
}

variable "key_vault_name" {
  type        = string
  description = "Key Vault name"
}

variable "frontend_vm_admin_username_key" {
  type        = string
  description = "Key for frontend VM admin username in Key Vault"
}

variable "frontend_vm_admin_username_value" {
  type        = string
  description = "Value for frontend VM admin username"
}

variable "frontend_vm_admin_password_key" {
  type        = string
  description = "Key for frontend VM admin password in Key Vault"
}

variable "frontend_vm_admin_password_value" {
  type        = string
  description = "Value for frontend VM admin password"
}

variable "backend_vm_admin_username_key" {
  type        = string
  description = "Key for backend VM admin username in Key Vault"
}

variable "backend_vm_admin_username_value" {
  type        = string
  description = "Value for backend VM admin username"
}

variable "backend_vm_admin_password_key" {
  type        = string
  description = "Key for backend VM admin password in Key Vault"
}

variable "backend_vm_admin_password_value" {
  type        = string
  description = "Value for backend VM admin password"
}

variable "sql_server_admin_login_key" {
  type        = string
  description = "Key for SQL Server login username"
}

variable "sql_server_admin_login_value" {
  type        = string
  description = "Value for SQL Server login username"
}

variable "sql_server_admin_password_key" {
  type        = string
  description = "Key for SQL Server login password"
}

variable "sql_server_admin_password_value" {
  type        = string
  description = "Value for SQL Server login password"
}
