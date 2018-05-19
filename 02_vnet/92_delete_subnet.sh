#!/usr/bin/env bash
. ../00_common/01_common_config.sh

az network vnet subnet delete -g ${baserg} \
 -n ${primary_operation_subnet} \
 --vnet-name ${primary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${primary_api_subnet} \
 --vnet-name ${primary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${primary_k8s_subnet} \
 --vnet-name ${primary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${primary_db_subnet} \
 --vnet-name ${primary_vnet}


az network vnet subnet delete -g ${baserg} \
 -n ${secondary_operation_subnet} \
 --vnet-name ${secondary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${secondary_api_subnet} \
 --vnet-name ${secondary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${secondary_k8s_subnet} \
 --vnet-name ${secondary_vnet}
az network vnet subnet delete -g ${baserg} \
 -n ${secondary_db_subnet} \
 --vnet-name ${secondary_vnet}
