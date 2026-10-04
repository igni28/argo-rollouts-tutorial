## Step 2 - Installing Argo Rollouts

Now we can install Argo Rollouts. 
Argo Rollouts extends Kubernetes with more advanced deployment strategies such as:

- canary deployments
- manual judgement
- blue-green deployments (out of scope here)
- automated rollbacks and promotions (out of scope here)

## Install the Argo Rollouts controller

First let's create a namespace for Argo Rollouts:

`kubectl create namespace argo-rollouts`{{exec}}

Now let's install the Argo Rollouts controller:

`kubectl apply --server-side -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/download/v1.10.0/install.yaml`{{exec}}

We will for the sake of this tutorial also download a plugin to Kubernetes provided by Argo Rollouts using these three commands:

`curl -LO https://github.com/argoproj/argo-rollouts/releases/download/v1.10.0/kubectl-argo-rollouts-linux-amd64`{{exec}}

`chmod +x kubectl-argo-rollouts-linux-amd64`{{exec}}

`sudo mv kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts`{{exec}}

Now let's verify that the plugin works:

`kubectl argo rollouts version`{{exec}}

If you see version info you're all good.