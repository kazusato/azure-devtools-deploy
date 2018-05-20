#!/usr/bin/env bash

. ../00_common/01_common_config.sh

client_id=$(az aks show -g ${baserg} -n ${primary_cluster_name} --query "servicePrincipalProfile.clientId" --output tsv)
echo "Client ID: " ${client_id}
subnet_id=$(az network vnet subnet show -g devtools-rg -n subnet-primary-k8s --vnet-name vnet-primary --query "id" --output tsv)
echo "Subnet ID: " ${subnet_id}
az role assignment create --assignee ${client_id} --role SubnetJoin --scope ${subnet_id}

