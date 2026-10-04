#!/bin/bash

set -e

kubectl get svc rollouts-demo
kubectl wait --for=jsonpath='{.status.phase}'=Healthy rollout/rollouts-demo --timeout=90s