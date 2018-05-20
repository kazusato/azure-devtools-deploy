#!/usr/bin/env bash
#
# ../nogit/01_secret_info.sh must contain the following line:
# lego_email=name@example.com
#

. ../nogit/01_secret_info.sh

helm install stable/kube-lego \
 --set config.LEGO_EMAIL=${lego_email} \
 --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory

