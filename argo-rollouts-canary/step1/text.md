# Step 1 - Checking the Kubernetes environment

Before actually using Argo Rollouts let's briefly look at the environment it runs on.

## What is Kubernetes?

For those who are using it for the first time **Kubernetes** is a platform for managin containerized applications (i. e. applications in an enclosed environment with everything they need)

It can, for example:
- run multiple replicas of an application at once
- restart containers if they don't work
- scale appliactions up (or down)
- deploy new versions of those applications

A **Kubernetes cluster** is a group of **nodes** (e. g. virtual machines) which can run the containers

In this tutorial, Killercoda provides us with a ready-to-use Kubernetes cluster, so you do not need to install Kubernetes yourself.

To interact with Kubernetes we use the command-line tool **kubect1**

## Let's check if the cluster works:
Run the following command:

```bash
kubectl get nodes
```

and check if among the values you see:

```text
STATUS: Ready
```

This means the Kubernetes nodes are working and are ready to host applications
Let's continue to the next step, which will be to install Argo Rollouts.