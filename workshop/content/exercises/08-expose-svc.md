
### 
**Exposing The Service**

NOTE: `LoadBalancer` features are platform specific. The visibility of your app after changing the service type might depend a lot on where it is deployed (e.g. per cloud provider).


*   If we want to expose the service publically we can change the service type to `LoadBalancer`

Next, you will go to `k8s/service.yaml` and change `ClusterIp` to `LoadBalancer`

Change the the type to LoadBalancer, click below to highlight the value that needs to change.
```editor:select-matching-text
file: k8s/service.yaml
text: "type: ClusterIP"
```

Delete the 16th line `type: ClusterIp` and create `updated-service.yaml'
```execute-1
sed '16d' k8s/service.yaml > k8s/updated-service.yaml
```

Insert the correct value into your service config.
```editor:insert-value-into-yaml
file: k8s/updated-service.yaml
path: spec
text: |
value:
        type: LoadBalancer

```

```execute-1
rm k8s/service.yaml
```

*   

Now, apply the updated `service.yaml` and your Kubernetes deployment.
```execute-1
kubectl apply -f ./k8s
```

*   



---


