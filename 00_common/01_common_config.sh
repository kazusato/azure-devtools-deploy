#!/usr/bin/env bash

# Regions
primary_region=eastus

# Resource Groups
baserg=devtools-rg

# VNet
# virtual network on the primary region
primary_vnet=vnet-primary
primary_vnet_cidr=10.1.0.0/16

# Subnet
# primary region / operation
primary_operation_subnet=subnet-primary-operation
primary_operation_subnet_cidr=10.1.0.0/24
# primary region / API
primary_api_subnet=subnet-primary-api
primary_api_subnet_cidr=10.1.1.0/24
# primary region / k8s
primary_k8s_subnet=subnet-primary-k8s
primary_k8s_subnet_cidr=10.1.2.0/24
# primary region / DB
primary_db_subnet=subnet-primary-db
primary_db_subnet_cidr=10.1.3.0/24

# AKS
# replace {{cluster_name}}
primary_cluster_name=devtools-cluster
# replace {{cluster_dns_prefix}}
primary_cluster_dns_prefix=devc

# Storage
primary_aks_vm_rg=MC_${baserg}_${primary_cluster_name}_${primary_region}
primary_storage_account_name=devtoolsstorageaccount
storage_sku=Standard_LRS

