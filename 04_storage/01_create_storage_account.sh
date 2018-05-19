#!/usr/bin/env bash
. ../00_common/01_common_config.sh

az storage account create -g ${primary_aks_vm_rg} \
 -n ${primary_storage_account_name} \
 -l ${primary_region} \
 --sku ${storage_sku}

