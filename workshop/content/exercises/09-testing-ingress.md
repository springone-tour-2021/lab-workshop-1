
In a Cloud environment (Google, Amazon, Azure etc.), Kubernetes will assign the service an external IP.  In this
lab environment a host name will also be provided.  Use the following command to view the host and IP address.

> The `-w` option of `kubectl` lets you watch a single Kubernetes resource.

```execute-1
kubectl get ingress k8s-demo-app -w
```

Please wait for the address field to show your new IP before continuing. You should see something like this.
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