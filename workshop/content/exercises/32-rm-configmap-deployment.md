
*   Before continuing lets remove our config map and revert the changes we made to `deployment.yaml`
To delete the ConfigMap run the following command

```execute-1
kubectl delete configmap log-level

```
In `kustomize/base/deployment.yaml` remove the `envFrom` properties we added

```execute-1
sed -i '32,34d' ~/demo/kustomize/base/deployment.yaml
```

*   Next we will use Kustomize to make generating ConfigMaps easier

Your `deployment.yaml` should be like this:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: k8s-demo-app
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: k8s-demo-app
    spec:
      containers:
      - image: {{ registry_host }}/apps/demo
        name: demo
        resources: {}
        readinessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/readiness
        livenessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/liveness
        lifecycle:
          preStop:
            exec:
              command:
                - sh
                - '-c'
                - sleep 10
status: {}
```
---
