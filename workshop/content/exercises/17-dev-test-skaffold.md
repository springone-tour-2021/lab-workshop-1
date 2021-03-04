
Skaffold makes some enhancements to our development workflow when using Kubernetes
*   Build the app and create the container (buildpacks)
*   Push the container to the registry (Docker)
*   Apply the deployment and service YAMLs
*   Stream the logs from the Pod to your terminal
*   Automatically setup port forwarding

Run the following command to have Skaffold build and deploy our application to Kubernetes.
```execute-1
skaffold dev --port-forward
```

---

### 
**Testing Everything Out**

If you use `watch` to view your Kubernetes resources you will see the same resources created as before
```execute-2
watch -n 1 kubectl get all
```

After the resources are created you can stop the `watch` command.
```terminal:interrupt
session: 1
```

When running `skaffold dev --port-forward` you will see a line in your console that looks like this

```
Port forwarding service/k8s-demo-app in namespace rbaxter, remote port 80 -> address 127.0.0.1 port 4503

```

In this case port `4503` will be forwarded to port `80` of the service

```execute-2
curl localhost:80
```

---