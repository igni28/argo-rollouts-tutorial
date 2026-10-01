## Step 2 - Installing Argo Rollouts

Now we can install Arog Rollouts
Argo Rollouts extends Kubernetes with more advanced deployment strategies such as:

- canary deployments
- blue-green deployments
- manual judgement
- automated rollbacks and promotions

## Install the Argo Rollouts controller

First Let's create a namespace for Argo Rollouts:

`bashkubectl create namespace argo-rollouts`{{exec}}