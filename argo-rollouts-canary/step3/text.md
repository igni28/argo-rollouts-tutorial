# Step 3 - Making the first stable Application

Now we can get into real work - it's time to deploy our first application.
The application will run as a Rollout, Argo's replacement for the Kubernetes Deployment. Its definition has already been prepared for you. Take a look:

`cat ~/rollout.yaml`{{exec}}

Notice these important values:

```yaml
replicas: 5
```

This means Kubernetes will run five copies of the application.

Also notice the strategy.canary.steps:

```text
- setWeight: 20
- pause: {}
- setWeight: 40
- pause:
    duration: 10
- setWeight: 60
- pause:
    duration: 10
- setWeight: 80
- pause:
    duration: 10
```
These steps define the rollout strategy. In our case, the first "setWeight" followed by "pause {}" sets the rollout to move 20 percent of pods to the new version, and then wait indefinitely. The rollout waits for a **promote** or an **abort**.

After the manual confirmation, the rollout is going to change the weight according to the steps and wait for the specified number of seconds. In our case it's 10 seconds after every increase.

The next part to notice is the initial container image:

```yaml
image: argoproj/rollouts-demo:blue
```

This will be our first stable version. 

Let's create the Kubernetes Service first:

`kubectl apply -f ~/service.yaml`{{exec}}

*Background information*: if you're not familiar with Kubernetes: The service spreads traffic over all pods with the label specified in the `service.yaml`. In our case, the label is `app: rollouts-demo`, which targets all the pods we're going to start.

## Now create the Rollout:

`kubectl apply -f ~/rollout.yaml`{{exec}}

## And inspect it:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

If you see the pods starting, try again after a few seconds. Instead, you can also use the `--watch` flag to keep monitoring the progress: 

`kubectl argo rollouts get rollout rollouts-demo --watch`{{exec}}

You should see 5 replicas of the blue version now.

To stop the watching process, press:

```text
Ctrl+C
```