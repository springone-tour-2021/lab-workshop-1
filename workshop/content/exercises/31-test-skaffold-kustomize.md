

### 
**Testing Skaffold + Kustomize**



*   If you run your normal `skaffold` commands it will use the deployment configuration from `kustomize/base`


```
skaffold dev --port-forward

```



*   If you want to test out the QA deployment run the following command to activate the QA profile


```
skaffold dev -p qa --port-forward
```


Be sure to kill the `skaffold` process before continuing



---


