#!/bin/bash

set -e

kubectl wait --for=jsonpath='{.status.phase}'=Paused rollout/rollouts-demo --timeout=50s

image=$(kubectl get rollout rollouts-demo -o jsonpath='{.spec.template.spec.containers[0].image}')
[ "$image" == "argoproj/rollouts-demo:red" ] || { echo "Rollout isn't using the red image but $image"; exit 1;}