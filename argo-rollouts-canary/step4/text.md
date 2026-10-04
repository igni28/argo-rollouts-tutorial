# Step 4 — Start your first Canary Rollout

The blue version of our application is currently stable and all five replicas are running it.

Now we will deploy a new version of the application: **yellow**.

Instead of replacing all five blue replicas at once, Argo Rollouts will introduce the new version gradually, via the canary rollout that we introduced earlier. We will roll out the new version in stages, which lets us check it before everyone gets it, and go back to the old version if something is wrong.

## Start the update

To start the rollout, we set the image in the Rollout to `argoproj/rollouts-demo:yellow`:

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:yellow`{{exec}}

`set image` takes the Rollout name followed by `containe=image`. Here, it finds the container called `rollouts-demo` inside the Rollout `rollouts-demo` and sets the image to `argoproj/rollouts-demo:yellow`.

One additional note: `set image` changes the Rollout stored in the cluster. The `rollout.yaml` file isn't changed, it still says blue. In a real project you'd edit the file in Git and apply it, which gives you more control over the reviewable history of releases. We use `set image` to keep the tutorial short.

This changes the container image in the Rollout from:

```text
argoproj/rollouts-demo:blue
```

to:

```text
argoproj/rollouts-demo:yellow
```

Changing the Pod template causes Argo Rollouts to create a new ReplicaSet for the yellow version.

## Observe the rollout

Run:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

You should now see both versions of the application in the images section.

Because our Rollout contains:

```yaml
- setWeight: 20
- pause: {}
```

Argo first moves the canary to a weight of 20% and then pauses indefinitely. You can inspect the `SetWeight` and `ActualWeight` fields in the `get rollout` command above.

With five replicas, this results in:

```text
4 × blue   — stable version
1 × yellow — canary version
```

You should also see that the Rollout is **Paused**.

## Inspect the Pods

Run:

```bash
kubectl get pods -l app=rollouts-demo -o custom-columns=POD:.metadata.name,IMAGE:.spec.containers[0].image
```{{exec}}

You will see that we have one pod running the new yellow image, and the remaining 4 pods (= 80% * 5) running the blue version.

You can inspect the Rollout again at any time with:

```bash
kubectl argo rollouts get rollout rollouts-demo
```{{exec}}

Do not promote the Rollout yet.

The purpose of this pause is to inspect/test/get feedback on the new version before exposing it more widely.

Continue to the next step when the yellow canary is running and the Rollout is paused.