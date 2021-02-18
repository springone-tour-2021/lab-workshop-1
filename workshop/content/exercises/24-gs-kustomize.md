

*   Create a new directory in the root of our project called `kustomize/base`
*   Move the `deployment.yaml` and `service.yaml` from the `k8s` directory into `kustomize/base`
*   Delete the `k8s` directory


```
$ mkdir -p kustomize/base
$ mv k8s/* kustomize/base
$ rm -Rf k8s
```




---
