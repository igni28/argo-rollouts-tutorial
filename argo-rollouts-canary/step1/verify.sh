#!/bin/bash

kubectl wait --for=condition=Ready node --all --timeout=60s