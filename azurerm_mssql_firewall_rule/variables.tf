variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server Name"
  type        = string
}

variable "backend_public_ip_name" {
  description = "Backend Public IP Resource Name"
  type        = string
}


variable "backend_public_ip_address" {
  description = "Backend Public IP Address Value"
  type        = string
}

variable "sql_server_id" {
  description = "ID of the SQL Server"
  type        = string
}
