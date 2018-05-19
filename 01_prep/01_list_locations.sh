#!/usr/bin/env bash
az account list-locations --query "[].{displayName:displayName, name:name}" -o table
