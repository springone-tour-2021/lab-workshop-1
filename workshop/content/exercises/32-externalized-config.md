

*   One of the [12 factors for cloud native apps](https://12factor.net/config) is to externalize configuration
*   Kubernetes provides support for externalizing configuration via ConfigMaps and Secrets

We can create a ConfigMap or secret easily using `kubectl`.  For example
```execute-1
kubectl create configmap log-level --from-literal=LOGGING_LEVEL_ORG_SPRINGFRAMEWORK=DEBUG
```


```execute-1
kubectl get configmap log-level -o yaml
```

```
apiVersion: v1
data:
  LOGGING_LEVEL_ORG_SPRINGFRAMEWORK: DEBUG
kind: ConfigMap
metadata:
  creationTimestamp: "2020-02-04T15:51:03Z"
  name: log-level
  namespace: {{ session_namespace }}
  resourceVersion: "2145271"
  selfLink: /api/v1/namespaces/default/configmaps/log-level
  uid: 742f3d2a-ccd6-4de1-b2ba-d1514b223868
```


