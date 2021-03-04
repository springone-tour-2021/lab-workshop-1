
### 
**Testing The App**

*   The service is assigned a cluster IP, which is only accessible from inside the cluster. 

To see this run the next command.
```execute-1
kubectl get service/k8s-demo-app
```

You should have gotten output like the following.
```
NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/k8s-demo-app   ClusterIP   10.100.200.243   <none>        80/TCP    68m

```

*   To access the app we can use `kubectl port-forward` to forward requests on port `8080` locally to port `80` on the service running in Kubernetes


```execute-1
kubectl port-forward service/k8s-demo-app 8080:80

```



*   Now we can `curl` localhost:8080 and it will be forwarded to the service in the cluster


```execute-2
curl http://localhost:8080
```


**Congrats you have deployed your first app to Kubernetes 🎉**

Be sure to stop the `kubectl port-forward` process before moving on

```terminal:interrupt
session: 1
```

<iframe src="https://giphy.com/embed/msKNSs8rmJ5m" width="480" height="357" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>


---



