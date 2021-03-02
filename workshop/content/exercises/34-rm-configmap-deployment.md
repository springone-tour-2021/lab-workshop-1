
*   Before continuing lets remove our config map and revert the changes we made to `deployment.yaml`
```execute-1
sed -i '39,41d' ~/demo/kustomize/base/deployment.yaml
```

*   To delete the config map run the following command

```execute-1
kubectl delete configmap log-level

```
*   In `kustomize/base/deployment.yaml` remove the `envFrom` properties we added
*   Next we will use Kustomize to make generating config maps easier



---
