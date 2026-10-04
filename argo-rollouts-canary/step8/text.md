# Step 8 — Reflection

## What you did

You released two new versions of the . The first one (yellow) was promoted, step by step, until it became the new stable version. The second one (red) was stopped at 20% and aborted, so only a small share of users would have been exposed to the unstable red version. This covers the learning outcomes: you saw how a canary deployment is safer than replacing everything at once, triggered and observed canary releases, and promoted or aborted them.

## Design Decisions

- You promoted or aborted the rollouts manually. It was easier to demonstrate here, but in production, you would likely base the decisions on metrics (e.g. using Prometheus), or combine it with a human in the loop.
- We gave you the rollout strategy with a 20% increase at a time. This made it easy to follow with the 5 replicas that we used, but other step sizes would likely work better for other apps. It depends highly on the environment and the application.
- We changed the new images via the `set image` command on the command line. This was easy to follow in the tutorial, but in real projects, the manifest would be managed in Git and would serve as the single source of truth. New images would only come via reviewed changes to the manifest.

## When is Argo Rollouts useful, when not?

It is **useful** for frequent releases where many users are affected by failures, as we can limit the exposure to failures. That applies to platform teams that care about the release risk. The app has to be running on multiple pods to use canary deployment strategies.

Canary releases naturally extend the continuous delivery of the "normal" DevOps pipeline. They allow you to release often because each release carries only a small risk and can be stopped quickly. Canary releases are most valuable when releases are frequent and automated, as in a continuous delivery pipeline.

Argo Rollouts is **less useful** for tiny apps or hobby projects where the extra tooling brings little value, but only adds overhead, or when changes cannot run side by side without major changes. Because old and new versions run at the same time, they must work together; for example with a shared database.

## Further reading

Check out the official Argo Rollouts documentation for more information: 
[Argo Rollouts documentation](https://argo-rollouts.readthedocs.io/en/stable/)