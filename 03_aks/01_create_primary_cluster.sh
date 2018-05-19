#!/usr/bin/env bash
. ../00_common/01_common_config.sh

template_file=template.json
parameter_file=parameters.json
parameter_temp_file_suffix=$(date +%Y%m%d_%H%M%S)
parameter_temp_file=${parameter_file}.${parameter_temp_file_suffix}

# check if the temporary parameter file exists
if [ -f ${parameter_temp_file} ]
then
 echo "delete ${parameter_temp_file} before executing."
 exit 1
fi

# replace sensitive information in the paramter file
# Subscription ID
subscription_id=$(az account list --query [].id -o tsv)
cp ${parameter_file} ${parameter_temp_file}
sed -i s/{{subscription_id}}/${subscription_id}/g ${parameter_temp_file}

# Service Principal
aks_sp_name=aks-${primary_cluster_name}
sp_info=$(az ad sp create-for-rbac -n ${aks_sp_name} --skip-assignment -o tsv)
sp_id=$(echo ${sp_info} | awk '{print $1}')
sp_secret=$(echo ${sp_info} | awk '{print $4}')
sed -i s/{{sp_id}}/${sp_id}/g ${parameter_temp_file}
sed -i s/{{sp_secret}}/${sp_secret}/g ${parameter_temp_file}

# replace common (non-sensitive) information in the paramter file
sed -i s/{{baserg}}/${baserg}/g ${parameter_temp_file}
sed -i s/{{log_analytics_workspace_name}}/$log_analytics_workspace_name{}/g ${parameter_temp_file}

# replace region-specific information in the parameter file
sed -i s/{{cluster_name}}/${primary_cluster_name}/g ${parameter_temp_file}
sed -i s/{{cluster_dns_prefix}}/${primary_cluster_dns_prefix}/g ${parameter_temp_file}
sed -i s/{{aks_region}}/${primary_region}/g ${parameter_temp_file}
sed -i s/{{aks_vnet}}/${primary_vnet}/g ${parameter_temp_file}
sed -i s/{{aks_subnet}}/${primary_subnet}/g ${parameter_temp_file}

# execute deployment
az group deployment create -g ${baserg} \
 --template-file ${template_file} \
 --parameters ${parameter_temp_file}
