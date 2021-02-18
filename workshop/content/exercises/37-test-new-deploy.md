


*   If you run `$ skaffold dev --port-forward` everything should deploy as normal
*   Check that the config map was generated


```
$ kubectl get configmap
NAME                             DATA   AGE
k8s-demo-app-config-fcc4c2fmcd   1      18s

```



*   Skaffold is watching our files for changes, go ahead and change `logging.level.org.springframework` from `INFO` to `DEBUG` and Skaffold will automatically create a new config map and restart the pod
*   You should see a lot more logging in your terminal once the new pod starts

Be sure to kill the `skaffold` process before continuing



---
