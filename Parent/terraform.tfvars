# ------------------------------------------------------------
# Resource Group Configuration
# ------------------------------------------------------------
resource_group_name     = "rit-rg"     # Name of the Azure Resource Group
resource_group_location = "East Asia" # Azure region where all resources will be deployed

# ------------------------------------------------------------
# Virtual Network Configuration
# ------------------------------------------------------------
virtual_network_name          = "rit-vnet"      # Name of the Virtual Network (VNet)
virtual_network_address_space = ["10.0.0.0/20"] # Address space range for the VNet

# ------------------------------------------------------------
# Subnets Configuration
# ------------------------------------------------------------
frontend_subnet_name     = "rit-frontend-subnet" # Name of the frontend subnet
frontend_subnet_prefixes = ["10.0.1.0/24"]       # Address range for the frontend subnet

backend_subnet_name     = "rit-backend-subnet" # Name of the backend subnet
backend_subnet_prefixes = ["10.0.2.0/24"]      # Address range for the backend subnet

# ------------------------------------------------------------
# Frontend Public IP & NSG
# ------------------------------------------------------------
frontend_public_ip_name    = "rit-pip-frontend" # Public IP name for frontend VM
frontend_nsg_name          = "rit-frontend-nsg" # Network Security Group for frontend
frontend_nsg_allowed_ports = [22, 80]           # Allowed ports: SSH (22), HTTP (80)

# ------------------------------------------------------------
# Frontend NIC (Network Interface Card)
# ------------------------------------------------------------
frontend_nic_name           = "rit-nic-frontend"           # Name of frontend NIC
frontend_nic_ip_config_name = "rit-nic-ip-config-frontend" # IP configuration name for frontend NIC

# ------------------------------------------------------------
# Frontend VM Configuration
# ------------------------------------------------------------
frontend_vm_name      = "rit-frontend-vm"              # VM Name
frontend_vm_size      = "Standard_B1s"                 # VM Size (B-series)
frontend_vm_publisher = "Canonical"                    # Image Publisher
frontend_vm_offer     = "0001-com-ubuntu-server-jammy" # Image Offer
frontend_vm_sku       = "22_04-lts"                    # SKU
frontend_vm_version   = "latest"                       # Image Version

# ------------------------------------------------------------
# Backend Public IP & NSG
# ------------------------------------------------------------
backend_public_ip_name    = "rit-pip-backend" # Public IP name for backend VM
backend_nsg_name          = "rit-backend-nsg" # NSG for backend
backend_nsg_allowed_ports = [22, 8000]        # Allowed ports: SSH (22), App port (8000)

# ------------------------------------------------------------
# Backend NIC
# ------------------------------------------------------------
backend_nic_name           = "rit-nic-backend"           # Backend NIC name
backend_nic_ip_config_name = "rit-nic-ip-config-backend" # IP config name

# ------------------------------------------------------------
# Backend VM Configuration
# ------------------------------------------------------------
backend_vm_name      = "rit-backend-vm"               # Backend VM name
backend_vm_size      = "Standard_B1s"                 # Size
backend_vm_publisher = "Canonical"                    # Image publisher
backend_vm_offer     = "0001-com-ubuntu-server-focal" # Offer
backend_vm_sku       = "20_04-lts"                    # SKU
backend_vm_version   = "latest"                       # Version

# ------------------------------------------------------------
# Azure SQL Server & Database
# ------------------------------------------------------------
sql_server_name   = "riteshserverne" # Name of Azure SQL Server
sql_database_name = "database"         # SQL Database name

# ------------------------------------------------------------
# Azure Key Vault
# ------------------------------------------------------------
key_vault_name = "rit-key-vault" # Name of Key Vault to store secrets

# ------------------------------------------------------------
# Secrets for Frontend VM
# ------------------------------------------------------------
frontend_vm_admin_username_key   = "frontend-admin-username" # Key name in Key Vault
frontend_vm_admin_username_value = "rit-frontend-vm"         # Username value
frontend_vm_admin_password_key   = "frontend-admin-password" # Key name for password
frontend_vm_admin_password_value = "ritesh@12123434"         # Password value

# ------------------------------------------------------------
# Secrets for Backend VM
# ------------------------------------------------------------
backend_vm_admin_username_key   = "backendend-admin-username"
backend_vm_admin_username_value = "rit-backend-vm"
backend_vm_admin_password_key   = "backend-admin-password"
backend_vm_admin_password_value = "ritesh@12123434"

# ------------------------------------------------------------
# Secrets for SQL Server
# ------------------------------------------------------------
sql_server_admin_login_key      = "sql-server-admin-login-username"
sql_server_admin_login_value    = "rit-sql-server"
sql_server_admin_password_key   = "sql-server-admin-password"
sql_server_admin_password_value = "My@Secure1234!"
