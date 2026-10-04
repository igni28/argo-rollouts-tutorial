## Step 2 - Installing Argo Rollouts

Now we can install Arog Rollouts
Argo Rollouts extends Kubernetes with more advanced deployment strategies such as:

- canary deployments
- blue-green deployments
- manual judgement
- automated rollbacks and promotions

## Install the Argo Rollouts controller

First Let's create a namespace for Argo Rollouts:

`kubectl create namespace argo-rollouts`{{exec}}

Now Let's Install the Argo Rollouts controller:

`kubectl apply --server-side -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/v1.10.0/download/install.yaml`{{exec}}

We will (although it is optional) for the sake of this tutorial also download a plugin to Kubernetes provided by Argo Rollouts using this 3 commands:
`curl -LO https://github.com/argoproj/argo-rollouts/releases/v1.10.0/download/kubectl-argo-rollouts-linux-amd64`{{exec}}

`chmod +x kubectl-argo-rollouts-linux-amd64`{{exec}}

`sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts`{{exec}}

Now Let's verify that the plugin works:

`kubectl argo rollouts version`{{exec}}

If you see version info you're all good