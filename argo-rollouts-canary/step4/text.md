# Step 4 — Start your first Canary Rollout

The blue version of our application is currently stable and all five replicas are running it.

Now we will deploy a new version of the application: **yellow**.

Instead of replacing all five blue replicas at once, Argo Rollouts will introduce the new version gradually - that's of course called a canary rollout.

## Start the update

Run:

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:yellow`{{exec}}

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

You should now see both versions of the application.

Because our Rollout contains:

```yaml
- setWeight: 20
- pause: {}
```

Argo first moves the canary to a weight of 20% and then pauses indefinitely.

With five replicas, this results in:

```text
4 × blue   — stable version
1 × yellow — canary version
```

You should also see that the Rollout is **Paused**.

## Inspect the Pods

Run:

```bash
kubectl get pods -l app=rollouts-demo
```{{exec}}

There should still be five application replicas in total, but they now belong to two different ReplicaSets.

You can inspect the Rollout again at any time with:

```bash
kubectl argo rollouts get rollout rollouts-demo
```{{exec}}

Do not promote the Rollout yet.

The purpose of this pause is to inspect/test/get feedback on the new version before exposing it more widely.

Go ahead when the yellow canary is running and the Rollout is paused.