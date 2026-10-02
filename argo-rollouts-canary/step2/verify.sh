#!/bin/bash

set -e

kubectl get crd rollouts.argoproj.io

kubectl rollout status deployment/argo-rollouts -n argo-rollouts

kubectl argo rollouts version

exit 0