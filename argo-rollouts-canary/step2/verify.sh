#!/bin/bash

set -e

#echo "Checking Argo Rollouts installed"

kubectl get crd rollouts.argoproj.io

kubectl rollout status deployment/argo-rollouts -n argo-rollouts

kubectl argo rollouts version

#echo "Argo Rollouts installed correctly."