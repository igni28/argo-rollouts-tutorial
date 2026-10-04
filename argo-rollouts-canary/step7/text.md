# Step 7 — Abort and Roll Back

The red version is currently running as a 20% canary.

As described before, we assume that testing or monitoring has detected a problem.

Instead of promoting the red release, we will abort it.

## Abort the rollout

Run:

`kubectl argo rollouts abort rollouts-demo`{{exec}}

The `abort` command stops the current rollout and restores the stable ReplicaSet, in our case the **yellow** one.

## Inspect the rollout

Run:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

You should see that the Rollout is now degraded, the red ReplicaSet is scaled down to zero, and all pods are running the yellow version again.

However, there is one important detail.

After an abort, the Rollout specification still contains the red image as the desired version So the application has returned to the stable yellow version, but the Rollout stays Degraded: the spec (the desired state) still says red, and `abort` only stopped the rollout; it didn't change the desired state.

## Restore the desired state

Change the desired image back to yellow:

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:yellow`{{exec}}



Argo Rollouts recognizes that yellow is already a stable revision and has passed its canary. Argo Rollouts treats this as a rollback. Argo skips the rollout steps for a rollback.

Wait until the Rollout becomes healthy and inspect the final state:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

The Rollout should now be **Healthy** again and yellow should be the stable version.

Click **Check** when the rollback is complete.