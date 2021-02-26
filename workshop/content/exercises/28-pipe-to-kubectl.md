

We can pipe the output from `kustomize` into `kubectl` in order to use the generated YAML to deploy the app to Kubernetes


```execute-1
kustomize build kustomize/qa | kubectl apply -f -

```



If you are watching the pods in your Kubernetes namespace you will now see two pods created instead of one


```
Every 1.0s: kubectl get all                                 Ryans-MacBook-Pro.local: Mon Feb  3 12:00:04 2020

NAME                                READY   STATUS    RESTARTS   AGE
pod/k8s-demo-app-647b8d5b7b-r2999   1/1     Running   0          83s
pod/k8s-demo-app-647b8d5b7b-x4t54   1/1     Running   0          83s

NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/k8s-demo-app   ClusterIP   10.100.200.200   <none>        80/TCP    84s

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/k8s-demo-app   2/2     2            2           84s

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.apps/k8s-demo-app-647b8d5b7b   2         2         2       84s
```


Our service `k8s-demo-app` will load balance requests between these two pods



---

