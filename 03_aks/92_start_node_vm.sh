#!/usr/bin/env bash
. ../00_common/01_common_config.sh
node_vm_rg=$(az group list --query [].name -o tsv | grep ^MC_${baserg} )
node_list=$(az vm list -g ${node_vm_rg} --query [].name -o tsv)
for i in ${node_list}
do
    az vm start -g ${node_vm_rg} -n ${i} --no-wait
done
