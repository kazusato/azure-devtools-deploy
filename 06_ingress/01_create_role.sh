#!/usr/bin/env bash
#
# ../nogit/01_secret_info.sh must contain the follwoing line:
# subscription=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
#

. ../nogit/01_secret_info.sh

az role definition create --role-definition '{
    "Name": "SubnetJoin",
    "Description": "Permit join action to subnets.",
    "Actions": [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
    ],
    "AssignableScopes": ["/subscriptions/'${subscription}'"]
}'

