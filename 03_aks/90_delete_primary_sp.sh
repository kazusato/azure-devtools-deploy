#!/usr/bin/env bash
. ../00_common/01_common_config.sh
az ad sp delete --id http://aks-${primary_cluster_name}
