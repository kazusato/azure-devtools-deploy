#!/usr/bin/env bash
. ../00_common/01_common_config.sh
az group create --name ${baserg} --location ${primary_region}

