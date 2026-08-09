# ⚡ Azure Modular Infrastructure Provisioning with Terraform 🚀

A modular, dynamic, and production-ready Infrastructure as Code (IaC) project built using **Terraform** and the **AzureRM Provider** (`~> 3.0`). This repository simplifies the automated provisioning of scalable Azure network topologies, resource groups, static public IP addresses, and Linux virtual machines using dynamic `for_each` map configurations. 🌟

---

## ✨ Key Highlights

- 🧩 **Modular Design**: Cleanly separated sub-modules (`resource_group`, `network`, `public_ip`, `virtual_machine`).
- 🔄 **Dynamic Provisioning**: Uses `for_each` loops driven by map objects in `terraform.tfvars`.
- 🌐 **Automated Topology**: Seamlessly connects Virtual Networks, Subnets, Network Interfaces, and Public IPs.
- 🐧 **Linux Workloads**: Deploys Ubuntu 22.04 LTS Linux Virtual Machines configured with dynamic NIC attachments.

---

## 🏗️ Architecture & Module Breakdown

This repository follows a modular Terraform architecture, separating infrastructure components into reusable sub-modules under the `modules/` directory: 📁

```text
.
├── 📄 main.tf                 # Root module invoking child modules with dependencies
├── 📄 variables.tf            # Root input variable declarations
├── 📄 providers.tf            # AzureRM provider configuration & version constraints
├── 📄 terraform.tfvars        # Sample input values for deployment
└── 📁 modules/
    ├── 📁 resource_group/     # Azure Resource Group module
    │   ├── 📄 main.tf
    │   ├── 📄 outputs.tf
    │   └── 📄 variables.tf
    ├── 📁 network/            # Virtual Networks (VNets) & Subnets module
    │   ├── 📄 main.tf
    │   ├── 📄 outputs.tf
    │   └── 📄 variables.tf
    ├── 📁 public_ip/          # Static Public IP addresses module
    │   ├── 📄 main.tf
    │   ├── 📄 outputs.tf
    │   └── 📄 variables.tf
    └── 📁 virtual_machine/    # Network Interfaces & Linux VMs module
        ├── 📄 main.tf
        └── 📄 variables.tf
```

---

## 📦 Provisioned Infrastructure Resources

| Module | Resource Type | Description |
| :--- | :--- | :--- |
| 📁 **Resource Group** | `azurerm_resource_group` | Dynamically provisions resource groups based on location & name mappings. |
| 🌐 **Network** | `azurerm_virtual_network`<br>`azurerm_subnet` | Creates Virtual Networks (VNets) and custom address space subnets. |
| 🌍 **Public IP** | `azurerm_public_ip` | Allocates static Standard SKU public IP addresses. |
| 🖥️ **Virtual Machine** | `azurerm_network_interface`<br>`azurerm_linux_virtual_machine` | Provisions NICs linked to subnets & public IPs, and deploys Linux VMs (Ubuntu 22.04 LTS). |

---

## 📋 Input Variables Overview

The infrastructure configuration is entirely map-driven in `terraform.tfvars`, enabling single or multi-region dynamic deployments: ⚙️

### 🔑 Key Maps in `variables.tf`:
- 🏷️ `resource_groups`: Map of RG objects containing `name` and `location`.
- 🌐 `vnets`: Map of VNet objects specifying `name`, `location`, `resource_group_name`, and `address_space`.
- 🔀 `subnets`: Map of subnet objects with `name`, `resource_group_name`, `virtual_network_name`, and `address_prefix`.
- 🌍 `public_ips`: Map of public IP configurations (`name`, `location`, `resource_group_name`).
- 💻 `vms`: Map of VM definitions including `name`, `location`, `resource_group_name`, `vm_size`, target `subnet_name`, `vnet_name`, and associated `public_ip_name`.

---

## 🚀 Quick Start Guide

### 🛠️ Prerequisites
- 🟦 [Terraform](https://www.terraform.io/downloads) >= 1.0.0 installed.
- ☁️ [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed.
- 🔐 Active Azure Subscription with deployment permissions.

### 🏃 Deployment Steps

1. 🔐 **Authenticate to Azure**
   ```bash
   az login
   ```

2. ⚙️ **Initialize Terraform**
   Initialize provider plugins and download child modules:
   ```bash
   terraform init
   ```

3. 🔍 **Preview Infrastructure Plan**
   Verify all resources that will be provisioned:
   ```bash
   terraform plan
   ```

4. 🚀 **Apply Infrastructure Configuration**
   Deploy resources directly to Microsoft Azure:
   ```bash
   terraform apply -auto-approve
   ```

5. 🧹 **Clean Up / Teardown**
   Destroy all provisioned infrastructure resources:
   ```bash
   terraform destroy -auto-approve
   ```

---

## 🔐 Security Considerations & Best Practices

- 🛡️ **Credentials Management**: Avoid storing sensitive passwords or SSH keys in plain text inside `terraform.tfvars`. Use environment variables (`TF_VAR_*`) or Azure Key Vault secrets.
- 💾 **State File Management**: Store `terraform.tfstate` securely in remote state storage (e.g., Azure Blob Storage with blob leasing and state locking enabled).
