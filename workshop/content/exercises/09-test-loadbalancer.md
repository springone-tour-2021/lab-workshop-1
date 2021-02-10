
### 
**Testing The Public LoadBalancer**



*   In a Cloud environment (Google, Amazon, Azure etc.), Kubernetes will assign the service an external ip
*   It may take a minute or so for Kubernetes to assign the service an external IP, until it is assigned you might see `<pending>` in the `EXTERNAL-IP` column

For a local cluster we need to manually set the external IP address to the IP address of the Kubernetes node (the docker container running Kind in this case): 
```execute-1
kubectl patch service k8s-demo-app -p '{"spec": {"type": "LoadBalancer", "externalIPs":["172.18.0.2"]}}'
```

*   


> The `-w` option of `kubectl` lets you watch a single Kubernetes resource.

```execute-1
kubectl get service k8s-demo-app -w
```

You sould see something like this:
```
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)        AGE
k8s-demo-app   LoadBalancer   10.100.200.243   172.18.0.2   80:31428/TCP   85m
```

Exit from the watch command
```terminal:interrupt-1
```


Test your endpoint
```execute-2
curl http://172.18.0.2
```

Kill the running processes
```terminal:interrupt-all
```


---