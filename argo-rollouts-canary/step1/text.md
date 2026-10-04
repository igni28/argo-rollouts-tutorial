# Step 1 - Checking the Kubernetes environment

Before actually using Argo Rollouts let's briefly look at the environment it runs on.

## What is Kubernetes?

A little recap: **Kubernetes** is a platform for managing containerized applications (i. e. applications in an enclosed environment with everything they need)

It can, for example:
- run multiple replicas of an application at once
- restart containers if they don't work
- scale applications up (or down)
- deploy new versions of those applications

A **Kubernetes cluster** is a group of **nodes** (e. g. virtual machines) which can run the containers.

You should familiarize yourself with Kubernetes if you have never used or seen it. You can use these two resources to get started:
- [Kubernetes Overview](https://kubernetes.io/docs/concepts/overview/)
- [Learn Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)

In this tutorial, Killercoda provides us with a ready-to-use Kubernetes cluster, so you do not need to install Kubernetes yourself.

To interact with Kubernetes we use the command-line tool **kubectl**

## Let's check if the cluster works:

Run the following command:

`kubectl get nodes`{{exec}}

You should see something like this:

```text
NAME            STATUS  ROLES           AGE     VERSION
controlplane    Ready   control-plane   10m     v1.36.1
```

- **NAME**: the name of the node
- **STATUS**: `Ready` means the node is healthy and can run applications
- **ROLES**: `control-plane` means this node also runs Kubernetes management components. It is the same node that will run our application in this tuturial. One node is enough for our application.
- **VERSION**: the Kubernetes version.

This means the Kubernetes nodes are working and are ready to host applications.

Let's continue to the next step, which will be to install Argo Rollouts.