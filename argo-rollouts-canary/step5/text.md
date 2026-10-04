# Step 5 — Promote the Canary

The yellow version is currently running as a 20% canary and the Rollout is paused.

At this point, a team would normally inspect logs, metrics, or test results before deciding whether the new version is safe to continue.

For this tutorial, we assume that the yellow version passed verification.

## Promote the Rollout and watch the rollout progress

Run:

`kubectl argo rollouts promote rollouts-demo && kubectl argo rollouts get rollout rollouts-demo --watch`{{exec}}

The `promote` command resumes a Rollout that is paused at a manual pause step.

You should see the yellow version gradually replacing the blue version, 20% at a time. The 20% are determined by the weights specified in the Rollout strategy:

```yaml
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

After manual promotion, Argo Rollouts will continue through these remaining steps automatically. The pauses determine how long each stage lasts.

The second command `kubectl argo rollouts get rollout rollouts-demo --watch` lets you watch the changes.

To stop the watching process, press:

```text
Ctrl+C
```

Do that once the rollout is completed (when the status shows `Healthy` and all pods run the yellow image).

## Check the final state

Run:

`kubectl argo rollouts get rollout rollouts-demo`{{exec}}

The Rollout should now be:

```text
Healthy
```

and the yellow image should be marked as:

```text
stable
```

The old blue ReplicaSet may still exist in the rollout history, but it should no longer have active application Pods.