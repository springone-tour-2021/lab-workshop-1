
In a Cloud environment (Google, Amazon, Azure etc.), Kubernetes will assign the service an external IP.  In this
lab environment a host name will also be provided.  Use the following command to view the host and IP address.

> The `-w` option of `kubectl` lets you watch a single Kubernetes resource.

```execute-1
kubectl get ingress k8s-demo-app -w
```

Depending on the ingress being used in the Kubernetes cluster you might need to wait for an IP address to be assigned to the ingress.  For
this lab, if you are using the hosted version you will not see an IP address assigned.  If you are running the workshop locally on
a Kubernetes cluster like Minikube you will need to wait for an IP address to be assigned.
```
NAME           CLASS    HOSTS                                                   ADDRESS        PORTS   AGE
k8s-demo-app   <none>   k8s-demo-app-lab-st-test-w01-s001.192.168.64.3.nip.io   192.168.64.3   80      6m27s
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