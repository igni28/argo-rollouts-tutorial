## Progressive Delivery with Argo Rollouts

Releasing a new app version to all users at once is risky: if it is broken, every user sees the app failing. Everyone is affected. A **canary deployment** reduces that risk by sending the new version to a small share of traffic first, so a problem can be noticed and solved before it reaches everybody.

In this tutorial you will use Argo Rollouts on Kubernetes to release a new version of a small web app step by step. We will pause the rollout to check it, and then decide to promote or abort it.

## Learning outcomes

After completing this tutorial you should be able to:

- explain why a canary deployment is safer than replacing the running version all at once
- trigger a canary release and observe its progress with argo rollouts
- promote or abort a release after inspecting the release