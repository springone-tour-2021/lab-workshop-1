
### 
**Exposing The Service**

NOTE: `LoadBalancer` features are platform specific. The visibility of your app after changing the service type might depend a lot on where it is deployed (e.g. per cloud provider).


*   If we want to expose the service publically we can change the service type to `LoadBalancer`

Next, you will go to `k8s/service.yaml` and change `ClusterIp` to `LoadBalancer`

Click below to highlight the value that needs to change.
```editor:select-matching-text
file: k8s/service.yaml
text: "type: ClusterIP"
```

Now, change the the type to `LoadBalancer`
```execute-1
 sed 's/ClusterIP/LoadBalancer/g' k8s/service.yaml -i
```

*   

Now, apply the updated `service.yaml` and your Kubernetes deployment.
```execute-1
kubectl apply -f ./k8s
```

*   


---


