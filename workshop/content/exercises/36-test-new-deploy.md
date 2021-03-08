


*   If you run `$ skaffold dev --port-forward` everything should deploy as normal
```execute-1
skaffold dev --port-forward
```

*   Check that the ConfigMap was generated
```execute-2
kubectl get configmap
```
* You should see something similar to this

```
NAME                             DATA   AGE
k8s-demo-app-config-fcc4c2fmcd   1      18s

```

Skaffold is watching our files for changes, go ahead and change `logging.level.org.springframework` from `INFO` to `DEBUG` and Skaffold will automatically create a new ConfigMap and restart the pod
* This is the field that you will be changing
```editor:select-matching-text
file: ~/demo/kustomize/base/application.yaml
text: "springframework" 
```

* To change `INFO` to `DEBUG`
```execute-2
sed -i s/INFO/DEBUG/g ~/demo/kustomize/base/application.yaml
```

*   You should see a lot more logging in your terminal once the new pod starts

Be sure to kill the `skaffold` process before continuing

```terminal:interrupt
session: 1
```

Also you will want to go back to `application.properties` in `kustomize/base` and change `logging.level.org.springframework` back to `INFO`.
```execute-2
sed -i s/DEBUG/INFO/g ~/demo/kustomize/base/application.yaml
```

To verify:
```editor:select-matching-text
file: ~/demo/kustomize/base/application.yaml
text: "springframework" 
```
---