#!/bin/bash

set -e

echo "Checking Argo Rollouts installed"

kubectl get crd rollouts.argoproj.io

kubectl get deployment argo-rollouts -n argo-rollouts

AVAILABLE=$(kubectl get deployment argo-rollouts -n argo-rollouts -o jsonpath='{.status.availableReplicas}')

#if [ -z "$AVAILABLE" ] || [ "$AVAILABLE" -lt 1 ]; then
#  echo "Argo Rollouts controller is not ready yet."
#  exit 1
#fi

kubectl argo rollouts version

echo "Argo Rollouts installed correctly."