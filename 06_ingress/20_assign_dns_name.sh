#!/usr/bin/env bash
. ../00_common/01_common_config.sh

public_ip=$(kubectl get svc -n ingress-nginx ingress-nginx -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
echo "Public IP: " ${public_ip}
public_ip_name=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '${public_ip}')].[name]" -o tsv)
echo "Public IP Name: " ${public_ip_name}
az network public-ip update -g ${primary_aks_vm_rg} -n ${public_ip_name} --dns-name ${dns_name}

