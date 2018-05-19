#!/usr/bin/env bash

kubectl config set-context devtools-ns-devtools --cluster=devtools-cluster --user clusterUser_devtools-rg_devtools-cluster --namespace devtools
kubectl config use-context devtools-ns-devtools
