# Step 6 — Deploy a Bad Release

The yellow version is now stable and running on all five replicas.

Now, we will simulate another release: the **red** version.

This time, imagine that monitoring or testing detects a problem while the new version is still running as a canary.

## Start the red release

Change the application image from yellow to red (like earlier in step 4 when we moved from blue to yellow):

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:red`{{exec}}

Argo Rollouts detects the change and creates a new ReplicaSet for the red version.

## Observe the new canary

Run:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

Just like before, the Rollout should stop at the first manual pause. What you see: 
What you see: the status is **Paused**, the `Images:` line lists `yellow (stable)` and `red (canary)` and `SetWeight`/`ActualWeight` are 20. 

The red version is not stable yet.

## Inspect the Pods

Run:

```bash
kubectl get pods -l app=rollouts-demo -o custom-columns=POD:.metadata.name,IMAGE:.spec.containers[0].image
```{{exec}}

The Rollout should now contain four pods running the yellow image and one pod running the red image.

Imagine that our monitoring system has detected errors in the red version.

In a real production environment, this could be detected using:

- error rates,
- failed health checks,
- increased latency,
- application logs,
- monitoring metrics.

## Why the canary helps

Thankfully, only (roughly) 20% of the users would see the broken red version (as opposed to 100% with an "all-at-once" release). This is why we use canary releases: to limit negative effects from unstable releases, which is desirable in DevOps.

**Do not promote the red release.**

Click check when the rollout has been paused.