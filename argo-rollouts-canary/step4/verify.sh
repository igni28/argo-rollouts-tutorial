#!/bin/bash

set -e
kubectl wait --for=jsonpath='{.status.phase}'=Paused rollout/rollouts-demo --timeout=60s