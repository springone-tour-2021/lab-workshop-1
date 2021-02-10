### 
**Add The Readiness Probe**

```editor:insert-value-into-yaml
file: k8s/deployment.yaml
path: spec.template.spec.containers.[0]
value:
        readinessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/readiness
```


### 
**Add The Liveness Probe**

```editor:insert-value-into-yaml
file: k8s/deployment.yaml
path: spec.template.spec.containers.[0]
value:
        livenessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/liveness
```