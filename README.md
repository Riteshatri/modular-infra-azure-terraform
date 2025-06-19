# modular-infra-azure-terraform
Modular Terraform-based Azure infrastructure deployment using best IaC practices.


# ☁️ Azure Infrastructure Deployment using Terraform Modules

Welcome to this Terraform project where we deploy a complete Azure infrastructure using a **modular and reusable approach**. This project is ideal for learning, production, or scaling large Azure environments efficiently.

---

## 📚 What This Repository Contains

This repository provisions the following Azure resources using Terraform:

* ✅ Resource Group
* 🌐 Virtual Network & Subnets
* 🔐 Key Vault & Secrets
* 🧠 SQL Server & Database
* 💻 Virtual Machines (Linux)
* 🌐 Public IP Address
* 🔌 Network Interfaces
* 🛡️ Network Security Groups

All of these are defined using **individual Terraform modules** to promote **reusability, scalability, and clean structure**.

---

## 🧱 Project Structure Explained

```bash
📁 modules/
├── azurerm_key_vault/               # Key Vault module
├── azurerm_key_vault_secrets/       # Secrets for Key Vault
├── azurerm_linux_virtual_machine/   # Linux VM module
├── azurerm_network_interface/       # NICs for VMs
├── azurerm_network_security_group/  # NSGs
├── azurerm_public_ip/               # Public IPs
├── azurerm_resource_group/          # Resource group
├── azurerm_sql_database/            # SQL DB
├── azurerm_sql_server/              # SQL Server
├── azurerm_subnet/                  # Subnets
├── azurerm_virtual_network/         # VNet

📁 todoapp/
├── main.tf               # Parent file calling all modules
├── provider.tf           # Azure provider config
├── variables.tf          # Input variables for root module
├── terraform.tfvars      # Variable values (default)
├── riteshcustom.tfvars   # Custom values for deployment
```

---

## 🚀 Getting Started

### 1. Prerequisites

* Azure CLI installed (`az login` to authenticate)
* Terraform installed
* A valid Azure subscription

### 2. Clone the Repository

```bash
git clone https://github.com/Riteshatri/modular-infra-azure-terraform.git
cd modular-infra-azure-terraform

```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Review the Plan

```bash
terraform plan -var-file="riteshcustom.tfvars"
```

### 5. Apply the Changes

```bash
terraform apply -var-file="riteshcustom.tfvars" -auto-approve
```

✅ Resources will now be deployed to Azure.

---

## 🔍 Inspect Terraform State

* List all resources:

```bash
terraform state list
```

* Inspect a specific resource:

```bash
terraform state show <resource_name>
```

---

## 📌 Why Modular Structure?

* ♻️ **Reusability:** Each module can be reused in other projects.
* 🔍 **Separation of Concerns:** Easy to debug and scale.
* 🧪 **Test Individually:** Each module can be tested independently.

---

## 📥 Variables Management

* `variables.tf`: All declared variables
* `terraform.tfvars`: Default values
* `riteshcustom.tfvars`: Custom values for your environment

To use custom values:

```bash
terraform apply -var-file="riteshcustom.tfvars"
```

---

## 💬 Author & Contact

Developed by **Ritesh Sharma**
💼 DevSecOps Engineer | Azure | Terraform Enthusiast | ADO | Docker | Kubernetes

🔗 [LinkedIn Profile](https://www.linkedin.com/in/riteshatri)

---

## 📃 License

This project is open-sourced under the MIT License.

---

> ⚠️ Tip: For production use, consider storing your state in a remote backend (like Azure Blob Storage) and use service principals for secure access.
