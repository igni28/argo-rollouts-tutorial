# Step 5 — Promote the Canary

The yellow version is currently running as a 20% canary and the Rollout is paused.

At this point, a team would normally inspect logs, metrics, or test results before deciding whether the new version is safe to continue.

For this tutorial, we assume that the yellow version passed verification.

## Promote the Rollout

Run:

`kubectl argo rollouts promote rollouts-demo`{{exec}}

The `promote` command resumes a Rollout that is paused at a manual pause step.

As you saw our Rollout strategy contains the following remaining steps:

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

After manual promotion, Argo Rollouts will continue through these remaining steps automatically, the pauses determine how long it takes to include more instances in the update.

## Watch the rollout progress

Run:

`kubectl argo rollouts get rollout rollouts-demo --watch`{{exec}}

You should see the yellow version gradually (20% at a time, determined by the weights u see above) replacing the blue version.

To stop the watching process, press:

```text
Ctrl+C
```

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