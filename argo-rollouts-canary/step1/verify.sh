#!/bin/bash

kubectl wait --for=condition=available node --all --timeout=60s