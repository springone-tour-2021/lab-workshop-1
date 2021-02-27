



Create a new directory in the root of our project called `kustomize/base`
```execute-1
mkdir -p kustomize/qa
```

Move the `deployment.yaml` and `service.yaml` from the `k8s` directory into `kustomize/base`
```execute-1
mv k8s/* kustomize/qa
```


Delete the `k8s` directory
```execute-1
rm -Rf k8s
```




---
