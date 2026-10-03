# Step 7 — Abort and Roll Back

The red version is currently running as a 20% canary.

We assume that testing or monitoring has detected a problem.

Instead of promoting the red release, we will abort it.

## Abort the rollout

Run:

`kubectl argo rollouts abort rollouts-demo`{{exec}}

The `abort` command stops the current rollout and restores the previous stable ReplicaSet.

In our case, the previous stable version is the **yellow** one


Inspect the rollout:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

You should see that the red canary is no longer being promoted and the yellow version is serving the application again.

However, there is one important detail.

After an abort, the Rollout specification still contains the red image as the desired version.

This means that the running application has returned to the stable yellow version, but the Rollout remains in a degraded state.

## Restore the desired state

Change the desired image back to yellow:

`kubectl argo rollouts set image rollouts-demo rollouts-demo=argoproj/rollouts-demo:yellow`{{exec}}

Argo Rollouts recognizes that yellow was the previous stable revision and restores it without repeating the normal canary progression.

Wait until the Rollout becomes healthy and inspect the final state:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

The Rollout should now be healthy again and yellow should be the stable version.

Click **CHECK** when the rollback is complete.