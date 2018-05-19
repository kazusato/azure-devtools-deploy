#!/usr/bin/env bash
. ../00_common/01_common_config.sh
az aks get-credentials -g ${baserg} -n ${primary_cluster_name} \
 --file ~/.kube/config_${primary_cluster_name}
