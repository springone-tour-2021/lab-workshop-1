
Use the following command to view the host and IP address.  

> The `-w` option of `kubectl` lets you watch a single Kubernetes resource.

```execute-1
kubectl get ingress k8s-demo-app -w
```

You should see output like the following.  Depending on the ingress being used in the Kubernetes cluster you might need to wait for an IP address to be assigned to the ingress.  If you are running this workshop in a Cloud environment (Google, Amazon, Azure etc.), or locally in a cluster like Minikube, you may need to wait for an IP address to be assigned. In the case of a cloud environment, Kubernetes will assign the service an external IP. In this hosted lab environment, only the host name will be provided, so you will not see an IP address assigned.

```
NAME           CLASS    HOSTS                                                                          ADDRESS                                                                   PORTS   AGE
k8s-demo-app   <none>   k8s-demo-app-eduk8s-labs-w01-s010.s1t-prod-31a4032.tanzu-labs.esp.vmware.com   a42e0185b95f34449943ea4c560be1d3-1763013971.us-east-2.elb.amazonaws.com   80      90s
```

Exit from the watch command
```terminal:interrupt
session: 1
```


Test the ingress configuration execute the following command.
```execute-2
curl k8s-demo-app-{{ session_namespace }}.{{ ingress_domain }}
```


---