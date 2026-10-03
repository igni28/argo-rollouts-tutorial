# Step 6 — Deploy a Bad Release

The yellow version is now stable and running on all five replicas.

Now, we will simulate another release: the **red** version.

This time, imagine that monitoring or testing detects a problem while the new version is still running as a canar.

## Start the red release

Change the application image from yellow to red:

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:red`{{exec}}

Argo Rollouts detects the change and creates a new ReplicaSet for the red version.

## Observe the new canary

Run:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

Just like before, the Rollout should stop at the first manual pause:

```text
80% yellow
20% red
```

The red version is not stable yet.

## Inspect the Pods

Run:

`kubectl get pods -l app=rollouts-demo`{{exec}}

The Rollout should now contain Pods from yellow and red ReplicaSets.

Imagine that our monitoring system has detected errors in the red version.

In a real production environment, this could be detected using:

- error rates,
- failed health checks,
- increased latency,
- application logs,
- monitoring metrics.

For this tutorial, we will simply assume that the red version has failed verification.

**Do not promote the red release.**
Click check when the rollout has been paused.