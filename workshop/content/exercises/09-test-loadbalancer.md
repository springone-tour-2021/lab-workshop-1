
### 
**Testing The Public Ingress**



In a Cloud environment (Google, Amazon, Azure etc.), Kubernetes will assign the service an external ip

> The `-w` option of `kubectl` lets you watch a single Kubernetes resource.

```execute-1
kubectl get ingress k8s-demo-app -w
```

You sould see something like this:
```
NAME           CLASS    HOSTS                                                   ADDRESS        PORTS   AGE
k8s-demo-app   <none>   k8s-demo-app-lab-st-test-w01-s001.192.168.64.3.nip.io   192.168.64.3   80      6m27s
```

Exit from the watch command
```terminal:interrupt-1
```


Test your endpoint with your browser or with curl.
```execute-2
curl k8s-demo-app-${SESSION_NAMESPACE}.${INGRESS_DOMAIN}
```


---