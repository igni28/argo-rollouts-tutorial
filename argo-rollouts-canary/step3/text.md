## Step 3 - Making the first stable Application

Now we can get into real work - it's time to deploy our first application.
It will run as an Argo Rollout, it's definition has already been prepared for you, run:

`cat /root/tutorial/rollout.yaml`{{exec}}

Notice these important values:

```yaml
replicas: 5
```

This means Kubernetes will run five copies of the application.

The initial container image is:

```yaml
image: argoproj/rollouts-demo:blue
```

This will be our first stable version.