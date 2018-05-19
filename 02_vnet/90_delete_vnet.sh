#!/usr/bin/env bash
. ../00_common/01_common_config.sh
az network vnet delete -g ${baserg} -n ${primary_vnet}
az network vnet delete -g ${baserg} -n ${secondary_vnet}

