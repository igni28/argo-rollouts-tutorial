## Step 3 - Making the first stable Application

Now we can get into real work - it's time to deploy our first application.
It will run as an Argo Rollout, it's definition has already been prepared for you, run:

`cat ~/rollout.yaml`{{exec}}

Notice these important values:

```yaml
replicas: 5
```

This means Kubernetes will run five copies of the application.

The initial container image is:

```yaml
image: argoproj/rollouts-demo:blue
```

This will be our first stable version, Let's create it, first we create the Kubernetes Service:
`kubectl apply -f ~/service.yaml`{{exec}}

## Now create the Rollout:

`kubectl apply -f ~/rollout.yaml`{{exec}}

## And inspect it:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

You should see 5 replicas of the blue version