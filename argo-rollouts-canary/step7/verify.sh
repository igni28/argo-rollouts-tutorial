#!/bin/bash

set -e

kubectl wait --for=jsonpath='{.status.phase}'=Healthy rollout/rollouts-demo --timeout=50s

image=$(kubectl get rollout rollouts-demo -o jsonpath='{.spec.template.spec.containers[0].image}')
[ "$image" == "argoproj/rollouts-demo:yellow" ] || { echo "Rollout isn't using the yellow image but $image"; exit 1; }